#include <dos.h>
#include "externs.h"

struct RESOURCE {
	char resname[12];
	unsigned short ressize;
	unsigned short resofs;
	unsigned short resunk;
};

void copy_paras_reverse(unsigned short srcseg, unsigned short destseg, short paras);

#define pushregs()\
	_asm {\
		push dx\
	}\


#define popregs()\
	_asm {\
		pop dx\
	}

char* mmgr_path_to_name(char* filename) {
	char* c;
	char* result;

	pushregs();
	
	result = filename;
	for (c = filename; *c; c++) {
		if (*c == ':' || *c == '\\') 
			result = c + 1;
	}
	
	popregs();
	return result;
}

void far* mmgr_alloc_pages(char* arg_0, unsigned short arg_2) {
	int i;
	struct RESOURCE* resdi;
	struct RESOURCE* ressi;
	char* chunkname;
	unsigned short rax, rdx;

	resdi = resptr2;
	ressi = resendptr1;
	rdx = resdi->resofs + resdi->ressize;
	resdi++;
	if (ressi <= resdi) {
		if (ressi == resendptr2) 
			fatal_error(aReservememoryO, arg_0);

		ressi++;
		resendptr1 = ressi;
	}

	resptr2 = resdi;
	chunkname = mmgr_path_to_name(arg_0);
	for (i = 0; i < 0xC; i++)
		resdi->resname[i] = chunkname[i];

	rax = arg_2;
	resdi->resofs = rdx;
	resdi->ressize = rax;
	resdi->resunk = 2;

	rax += rdx;
	if (rax > resmaxsize) 
		resmaxsize = rax;

	if (rax > ressi->resofs) {
		ressi = resendptr1;
		resdi = resptr2;
		rax = resdi->resofs + resdi->ressize;
	
		while (rax > ressi->resofs) {
			if (ressi == resendptr2)
				fatal_error(aReservememoryOutOfMemory, arg_0, resdi->ressize, resmaxsize);

			ressi->resunk = 0;
			ressi++;
			resendptr1 = ressi;
		}
	}

	return MK_FP(rdx, 0);
}

void far* dos_get_psp() {
	unsigned short resseg, resofs;
	__asm {
		push ds
		mov ah, 62h
		int 21h
		mov resseg, ds
		mov resofs, bx
		pop ds
	}
	return MK_FP(resseg, resofs);
}

unsigned short dos_alloc(unsigned short paras) {
	unsigned short resseg;
	__asm {
		mov bx, paras
		mov ah, 48h
		int 21h
		mov resseg, ax
	}
	return resseg;
}

unsigned short dos_setblock(unsigned short blockseg, unsigned short newsize) {
	unsigned short res;
	__asm {
		mov bx, newsize
		mov es, blockseg
		mov ah, 4ah
		int 21h
		mov res, bx	// bx = max blocks
	}
	return res;
}

void mmgr_alloc_resmem(unsigned short arg_0) {

	void far* psp;
	unsigned short maxblocks;
	struct RESOURCE* rp;

	psp = dos_get_psp();
	pspseg = FP_SEG(psp);
	pspofs = FP_OFF(psp);
	
	if (word_3FF82 == 0) {
		resptr1->resofs = dos_alloc(0x64);
		word_3FF84 = resptr1->resofs;
		maxblocks = dos_setblock(resptr1->resofs, arg_0 - resptr1->resofs);
		maxblocks = dos_setblock(resptr1->resofs, maxblocks);
		resendptr2->resofs = word_3FF84 + maxblocks;
		word_3FF82 = resendptr2->resofs;
	}
	resendptr1 = resendptr2;
	resptr2 = resptr1;
	
	rp = resptr1;
	for (;;) {
		rp++;
		if (rp == resendptr2) break;
		rp->resunk = 0;
	}
}

void mmgr_alloc_a000() {
	return mmgr_alloc_resmem(0xa000);
}

unsigned short mmgr_get_ofs_diff() {
	return resendptr2->resofs - resptr2->resofs - resptr2->ressize;
}

void far* mmgr_free(unsigned short arg_0, unsigned short arg_2) {
	int i;
	unsigned short ax, bx, cx, dx, di;
	struct RESOURCE* ressi;
	struct RESOURCE* resbx;

	ressi = resptr2;

	while (1) {
		if (ressi == resptr1) 
			fatal_error(aMemoryManagerB, arg_2);
		if (ressi->resofs == arg_2) break;
		ressi--;
	}

	arg_2 = 0;
	ressi->resunk = 0;
	if (ressi != resptr2) {
		if (ressi == resendptr1) goto loc_31508;
		ax = resendptr1->resofs - resptr2->resofs - resptr2->ressize;
		if (ax < ressi->ressize) goto loc_31508;
	}

	arg_2 = resendptr1->resofs - ressi->ressize;
	resendptr1--;
	resendptr1->resofs = arg_2;
	resendptr1->ressize = ressi->ressize;
	resendptr1->resunk = 1;

	for (i = 0; i < 0xC; i++) {
		resendptr1->resname[i] = ressi->resname[i];
	}

	copy_paras_reverse(ressi->resofs, arg_2, ressi->ressize);

loc_31508:
	if (ressi == resptr2) {
		do {
			ressi--;
		} while (ressi->resunk == 0);
		resptr2 = ressi;
	}

	return MK_FP(arg_0, arg_2);
}

void mmgr_copy_paras(unsigned short srcseg, unsigned short destseg, short paras) {
	unsigned short count; // number of words to copy
	unsigned short far * srcptr;
	unsigned short far * destptr;
	
	while (paras != 0) {
		count = 0x8000; // 64k in words
		paras -= 0x1000; // 64k in paras
		if (paras < 0) {
			count = (paras + 0x1000) << 3;  // count = remaining paras < 0x1000 in words
			paras = 0;
		}
		srcptr = MK_FP(srcseg, 0);
		destptr = MK_FP(destseg, 0);

		while (count) {
			*destptr = *srcptr;
			srcptr++;
			destptr++;
			count--;
		}

		srcseg += 0x1000;
		destseg += 0x1000;
	}
}


void copy_paras_reverse(unsigned short srcseg, unsigned short destseg, short paras) {
	unsigned short count, ofs;
	unsigned short far* destptr;
	unsigned short far* srcptr;

	pushregs();

	srcseg += paras;
	destseg += paras;

	while (paras != 0) {
		count = 0x1000;
		paras -= 0x1000;
		if (paras < 0) {
			count = paras + 0x1000;
			paras = 0;
		}
		srcseg -= count;
		destseg -= count;
		count <<= 3;
		ofs = (count << 1) - 2;

		srcptr = MK_FP(srcseg, ofs);
		destptr = MK_FP(destseg, ofs);
		while (count) {
			*destptr = *srcptr;
			srcptr--;
			destptr--;
			count--;
		}
	}
	popregs();
}

void mmgr_find_free() {
	int i;
	unsigned short regax, regdx;
	struct RESOURCE* ressi;
	struct RESOURCE* resdi;

	pushregs();

	ressi = resendptr2;
	resdi = ressi;
	regdx = 0;

	do {
		if ((ressi->resunk & 1) == 0) {
			regdx += ressi->ressize;
		} else {
		
			if (regdx != 0) {
				resdi++;
				regax = resdi->resofs - ressi->ressize;
				resdi--;
				resdi->ressize = ressi->ressize;
				resdi->resofs = regax;
				ressi->resunk = 0;
				resdi->resunk = ressi->resunk;
				for (i = 0; i < 0xC; i++) {
					resdi->resname[i] = ressi->resname[i];
				}
				copy_paras_reverse(ressi->resofs, regax, ressi->ressize);
			}
		
			resdi--;
		}
		ressi--;
	} while (ressi > resendptr1);

	resdi++;
	resendptr1 = resdi;

	popregs();
}

void far* mmgr_get_unk(char* arg_0) {
	int i;
	unsigned short regax, regbx, regcx, regdx;
	char* strdi;
	struct RESOURCE* ressi;
	struct RESOURCE* resdi;

	ressi = resendptr1;
	strdi = mmgr_path_to_name(arg_0);

	for (ressi = resendptr1; ressi < resendptr2; ressi++) {
		regbx = 0;
		if (ressi->resunk == 0) return MK_FP(0, 0);

		for (; regbx < 0xC; regbx++) {
			if (strdi[regbx] == 0) break;
			if (strdi[regbx] != ressi->resname[regbx]) break;
		}

		if (regbx == 0xC || ressi->resname[regbx] == '.' || ressi->resname[regbx] == 0) {
			resdi = resptr2;
			regdx = resdi->resofs;
			regdx += resdi->ressize;
			resdi++;
			resptr2 = resdi;
			regax = ressi->ressize;
		
			ressi->resunk = 0;
			resdi->resofs = regdx;
			resdi->ressize = regax;
			resdi->resunk = 2;
			regbx = 0;
			for (i = 0; i < 0xC; i++) {
				resdi->resname[i] = ressi->resname[i];
			}
			
			if (resdi == resendptr1) {
				resendptr1++;
			}
		
			mmgr_copy_paras(ressi->resofs, regdx, ressi->ressize);
			ressi = resendptr1;
			resdi = resptr2;
			regax = resdi->resofs;
			regax += resdi->ressize;
		
			while (regax > ressi->resofs) {
				ressi->resunk = 0;
				ressi++;
				resendptr1 = ressi;
			}
		
			mmgr_find_free();
			regdx = resdi->resofs;
			return MK_FP(regdx, 0);
		}
	}

	return MK_FP(0, 0);
}



void mmgr_op_unk2(unsigned short arg_0, unsigned short arg_2) {
	int i;
	unsigned short regax, regbx, regcx, regdx;
	char* strdi;
	struct RESOURCE* ressi;
	struct RESOURCE* resdi;

	pushregs();
	__asm {
		push bx
	}

	regax = arg_2;
	ressi = resptr2;

	for (;;) {
		if (ressi == resptr1) 
			fatal_error(aMemoryManagerB, arg_2);
		if (regax == ressi->resofs) break;
		ressi--;
	}
	
	ressi->resunk = 0;
	if (ressi == resptr2) {
		do {
			ressi--;
		} while (ressi->resunk == 1);
		resptr2 = ressi;
	}

	__asm {
		pop bx
	}
	popregs();
}

void mmgr_get_chunk_size(unsigned short arg_0, unsigned short arg_2) {
	int i;
	unsigned short regax, regbx, regcx, regdx;
	char* strdi;
	struct RESOURCE* ressi;
	struct RESOURCE* resdi;

	regax = arg_2;
	ressi = resptr2;

	for (;;) {
		if (ressi == resptr1) 
			fatal_error(aMemoryManagerB, arg_2);
		if (regax == ressi->resofs) break;
		ressi--;
	}
	return ressi->ressize;
}

void mmgr_resize_memory(unsigned short arg_0, unsigned short arg_2, unsigned short arg_4) {
__asm {
    push    si
    push    di
    mov     ax, [arg_2]
    mov     si, resptr2
loc_316AE:
    cmp     si, resptr1
    jz      short loc_316BE
    cmp     ax, [si+.resofs]
    jz      short loc_316C1
    sub     si, 12h
    jmp     short loc_316AE
loc_316BE:
    //jmp     loc_31498
    push    [arg_2]
    mov     ax, offset aMemoryManagerB // "memory manager - BLOCK NOT FOUND at SEG"...
    push    ax
    call    far ptr fatal_error

loc_316C1:
    mov     ax, [arg_4]
    cmp     ax, [si+.ressize]
    ja      short loc_316D0
    mov     [si+.ressize], ax
    pop     di
    pop     si
    jmp endfunc
loc_316D0:
    cmp     si, resptr2
    jnz     short loc_316F4
    mov     [si+.ressize], ax
    mov     di, resendptr1
    add     ax, [si+.resofs]
    cmp     ax, resmaxsize
    jb      short loc_316E9
    mov     resmaxsize, ax
loc_316E9:
    cmp     ax, [di+.resofs]
    ja      short loc_316FD
loc_316EE:
    xor     ax, ax
    pop     di
    pop     si
    jmp endfunc
loc_316F4:
    mov     ax, offset aResizememoryCa //  "resizememory - CANNOT EXPAND BLOCK NOT "...
    push    ax
    call    far ptr fatal_error
loc_316FD:
    mov     si, resendptr1
    mov     di, resptr2
    mov     ax, [di+.resofs]
    add     ax, [di+.ressize]
loc_3170B:
    cmp     ax, [si+.resofs]
    jbe     short loc_316EE
    cmp     si, resendptr2
    jz      short loc_31724
    mov     word ptr [si+.resunk], 0
    add     si, 12h
    mov     resendptr1, si
    jmp     short loc_3170B
loc_31724:
    mov     bx, resmaxsize
    push    bx
    mov     ax, offset aResizememoryNo //  "resizememory - NO MEMORY LEFT TO EXPAND"...
    push    ax
    call    far ptr fatal_error
}
endfunc:
}

void mmgr_op_unk(unsigned short arg_0, unsigned short arg_2) {
__asm {
    push    si
    push    di
    mov     ax, [arg_2]
    mov     si, resptr2
loc_3173E:
    cmp     si, resptr1
    jz      short loc_3174E
    cmp     ax, [si+.resofs]
    jz      short loc_31751
    sub     si, 12h
    jmp     short loc_3173E
loc_3174E:
//    jmp     loc_31498
    push    [arg_2]
    mov     ax, offset aMemoryManagerB // "memory manager - BLOCK NOT FOUND at SEG"...
    push    ax
    call    far ptr fatal_error

loc_31751:
    mov     di, si
    sub     di, 12h
    cmp     word ptr [di+.resunk], 0
    jnz     short loc_317AD
loc_3175C:
    sub     di, 12h
    cmp     word ptr [di+.resunk], 0
    jz      short loc_3175C
    mov     word ptr [si+.resunk], 0
    mov     bx, [si+.ressize]
    push    bx
    mov     ax, [di+.resofs]
    add     ax, [di+.ressize]
    push    ax
    push    word ptr [si+.resofs]
    add     di, 12h
    cmp     si, resptr2
    jnz     short loc_31785
    mov     resptr2, di
loc_31785:
    mov     [di+.resofs], ax
    mov     [di+.ressize], bx
    mov     word ptr [di+.resunk], 2
    mov     cx, 0Ch
    xor     bx, bx
loc_31795:
    mov     al, byte ptr [bx+si+.resname]
    mov     byte ptr [bx+di+.resname], al
    inc     bx
    loop    loc_31795
    call    far ptr mmgr_copy_paras
    add     sp, 6
loc_317A4:
    mov     dx, [di+.resofs]
    xor     ax, ax
    pop     di
    pop     si
    jmp endfunc
loc_317AD:
    mov     di, si
    jmp     short loc_317A4
}
endfunc:
}
