.model medium
nosmart
    include structs.inc
    include custom.inc
    include seg000.inc
    include seg001.inc
    include seg002.inc
    include seg003.inc
    include seg004.inc
    include seg005.inc
    include seg006.inc
    include seg007.inc
    include seg008.inc
    include seg009.inc
    include seg010.inc
    include seg011.inc
    include seg012.inc
    include seg013.inc
    include seg014.inc
    include seg015.inc
    include seg016.inc
    include seg017.inc
    include seg018.inc
    include seg019.inc
    include seg020.inc
    include seg021.inc
    include seg022.inc
    include seg023.inc
    include seg024.inc
    include seg025.inc
    include seg026.inc
    include seg027.inc
    include seg028.inc
    include seg029.inc
    include seg030.inc
    include seg031.inc
    include seg032.inc
    include seg034.inc
    include seg035.inc
    include seg036.inc
    include seg037.inc
    include seg038.inc
    include seg039.inc
    include dseg.inc
    include seg041.inc
seg033 segment byte public 'STUNTSC' use16
    assume cs:seg033
    assume es:nothing, ss:nothing, ds:dseg
    public setup_mcgawnd1
    public setup_mcgawnd2
setup_mcgawnd1 proc far

    mov     ax, word ptr mcgawndsprite
    or      ax, word ptr mcgawndsprite+2
    jnz     short loc_3A97C
    mov     ax, 0Fh
    push    ax
    mov     ax, 0C8h ; '�'
    push    ax
    mov     ax, 140h
    push    ax
    call    sprite_make_wnd
    add     sp, 6
    mov     word ptr mcgawndsprite, ax
    mov     word ptr mcgawndsprite+2, dx
loc_3A97C:
    mov     ax, offset sprite2
    mov     dx, seg seg012
    push    dx
    push    ax
    call    sprite_set_1_from_argptr
    add     sp, 4
    les     bx, mcgawndsprite
    push    word ptr es:[bx+2]
    push    word ptr es:[bx]
loc_3A997:
    call    sprite_putimage
    add     sp, 4
    retf
setup_mcgawnd1 endp
setup_mcgawnd2 proc far

    mov     ax, word ptr mcgawndsprite
    or      ax, word ptr mcgawndsprite+2
    jnz     short loc_3A9C4
    mov     ax, 0Fh
    push    ax
    mov     ax, 0C8h ; '�'
    push    ax
    mov     ax, 140h
    push    ax
    call    sprite_make_wnd
    add     sp, 6
loc_3A9BD:
    mov     word ptr mcgawndsprite, ax
loc_3A9C0:
    mov     word ptr mcgawndsprite+2, dx
loc_3A9C4:
    push    word ptr mcgawndsprite+2
loc_3A9C8:
    push    word ptr mcgawndsprite
loc_3A9CC:
    call    sprite_set_1_from_argptr
    add     sp, 4
    retf
setup_mcgawnd2 endp
seg033 ends
end
