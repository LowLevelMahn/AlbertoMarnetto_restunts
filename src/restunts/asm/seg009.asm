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
    include seg033.inc
    include seg034.inc
    include seg035.inc
    include seg036.inc
    include seg037.inc
    include seg038.inc
    include seg039.inc
    include dseg.inc
    include seg041.inc
seg009 segment byte public 'STUNTSC' use16
    assume cs:seg009
    assume es:nothing, ss:nothing, ds:dseg
    public sub_2A2BC
    public sub_2BEB6
    public sub_2C0A8
    public sub_2C81C
    public sub_2C9B4
sub_2A2BC proc far
    var_198 = word ptr -408
    var_196 = word ptr -406
    var_194 = word ptr -404
    var_192 = byte ptr -402
    var_190 = byte ptr -400
    var_18E = byte ptr -398
    var_18D = byte ptr -397
    var_18C = byte ptr -396
    var_18A = byte ptr -394
    var_188 = byte ptr -392
    var_186 = byte ptr -390
    var_184 = byte ptr -388
    var_182 = byte ptr -386
    var_180 = byte ptr -384
    var_17F = byte ptr -383
    var_17E = byte ptr -382
    var_17C = dword ptr -380
    var_178 = byte ptr -376
    var_176 = byte ptr -374
    var_174 = byte ptr -372
    var_172 = word ptr -370
    var_170 = word ptr -368
    var_16E = word ptr -366
    var_16C = word ptr -364
    var_16A = word ptr -362
    var_168 = word ptr -360
    var_166 = word ptr -358
    var_164 = word ptr -356
    var_162 = byte ptr -354
    var_DC = word ptr -220
    var_DA = byte ptr -218
    var_D8 = byte ptr -216
    var_D6 = byte ptr -214
    var_D4 = byte ptr -212
    var_D2 = word ptr -210
    var_D0 = word ptr -208
    var_CC = word ptr -204
    var_CA = word ptr -202
    var_C8 = word ptr -200
    var_C6 = byte ptr -198
    var_C4 = byte ptr -196
    var_C2 = byte ptr -194
    var_C0 = byte ptr -192
    var_BE = byte ptr -190
    var_3A = word ptr -58
    var_38 = word ptr -56
    var_36 = byte ptr -54
    var_34 = byte ptr -52
    var_32 = byte ptr -50
    var_30 = byte ptr -48
    var_2E = byte ptr -46
    var_2C = byte ptr -44
    var_2A = word ptr -42
    var_28 = word ptr -40
    var_26 = word ptr -38
    var_24 = word ptr -36
    var_22 = word ptr -34
    var_20 = word ptr -32
    var_1E = byte ptr -30
    var_1C = byte ptr -28
    var_1A = byte ptr -26
    var_18 = word ptr -24
    var_16 = byte ptr -22
    var_14 = byte ptr -20
    var_12 = byte ptr -18
    var_10 = dword ptr -16
    var_C = byte ptr -12
    var_A = byte ptr -10
    var_8 = byte ptr -8
    var_6 = byte ptr -6
    var_4 = word ptr -4
    var_2 = word ptr -2
     s = byte ptr 0
     r = byte ptr 2

    push    bp
    mov     bp, sp
    sub     sp, 198h
    push    di
    push    si
    mov     ax, 34B0h
    push    ax
    call    load_2dshape1
    add     sp, 2
    mov     [bp+var_2A], ax
    mov     [bp+var_28], dx
    mov     ax, 70CCh
    push    ax
    mov     ax, 3592h
    push    ax
    push    dx
    push    [bp+var_2A]
    call    locate_many_resources
    add     sp, 8
    mov     ax, 70BCh
    push    ax
    mov     ax, 35E0h
    push    ax
    push    [bp+var_28]
    push    [bp+var_2A]
    call    locate_many_resources
    add     sp, 8
    mov     ax, 7118h
    push    ax
    mov     ax, 35F2h
    push    ax
    push    [bp+var_28]
    push    [bp+var_2A]
    call    locate_many_resources
    add     sp, 8
    mov     ax, 0Fh
    push    ax
    les     bx, dword_4282C
    push    word ptr es:[bx+2]
    mov     ax, es:[bx]
    imul    word_44AE4
    push    ax
    call    make_wnd_sprite
    add     sp, 6
    mov     [bp+var_172], ax
    mov     [bp+var_170], dx
    mov     ax, 0Fh
    push    ax
    les     bx, dword_42830
    push    word ptr es:[bx+2]
    mov     ax, es:[bx]
    imul    word_44AE4
    push    ax
    call    make_wnd_sprite
    add     sp, 6
    mov     [bp+var_16E], ax
    mov     [bp+var_16C], dx
    mov     ax, 0Fh
    push    ax
    les     bx, dword_42834
    push    word ptr es:[bx+2]
    mov     ax, es:[bx]
    imul    word_44AE4
    push    ax
    call    make_wnd_sprite
    add     sp, 6
    mov     [bp+var_16A], ax
    mov     [bp+var_168], dx
    mov     ax, 0Fh
    push    ax
    les     bx, dword_42838
    push    word ptr es:[bx+2]
    mov     ax, es:[bx]
    imul    word_44AE4
    push    ax
    call    make_wnd_sprite
    add     sp, 6
    mov     [bp+var_166], ax
    mov     [bp+var_164], dx
    mov     ax, 34B8h
    push    ax
    call    load_res_file
    add     sp, 2
    mov     [bp+var_22], ax
    mov     [bp+var_20], dx
    mov     ax, 0Fh
    push    ax
    mov     ax, 0C8h ; '�'
    push    ax
    mov     ax, 140h
    push    ax
    call    make_wnd_sprite
    add     sp, 6
    mov     word ptr wndsprite, ax
    mov     word ptr wndsprite+2, dx
    mov     ax, 34BEh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_shape_alt
    add     sp, 6
    mov     word_42540, ax
    mov     word_42542, dx
    mov     ax, 34C3h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_shape_alt
    add     sp, 6
    mov     [bp+var_26], ax
    mov     [bp+var_24], dx
    mov     ax, 34C8h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_shape_alt
    add     sp, 6
    mov     [bp+var_4], ax
    mov     [bp+var_2], dx
    mov     ax, 34CDh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_shape_alt
    add     sp, 6
    mov     [bp+var_D2], ax
    mov     [bp+var_D0], dx
    mov     [bp+var_D4], 0
    sub     si, si
loc_2A43E:
    mov     [bp+si+var_162], 0FFh
    mov     [bp+si+var_BE], 0FFh
    inc     si
    cmp     si, 84h ; '�'
    jl      short loc_2A43E
    sub     si, si
loc_2A451:
    mov     ax, si
    shl     ax, 1
    shl     ax, 1
    mov     [bp+var_194], ax
    mov     ax, [bp+var_26]
    mov     dx, [bp+var_24]
    add     ax, [bp+var_194]
    mov     word ptr [bp+var_17C], ax
    mov     word ptr [bp+var_17C+2], dx
    les     bx, [bp+var_17C]
    mov     al, es:[bx]
    mov     byte_463E4, al
    mov     al, es:[bx+1]
    mov     byte_463E5, al
    mov     al, es:[bx+2]
    mov     byte_463E6, al
    mov     al, es:[bx+3]
    mov     byte_463E7, al
    mov     ax, 0AC74h
    push    ax
    push    [bp+var_28]
    push    [bp+var_2A]
    call    locate_shape_1
    add     sp, 6
    mov     bx, [bp+var_194]
    mov     [bx+6AE8h], ax
    mov     [bx+6AEAh], dx
    mov     ax, si
    shl     ax, 1
    shl     ax, 1
    mov     [bp+var_196], ax
    mov     ax, [bp+var_4]
    mov     dx, [bp+var_2]
    add     ax, [bp+var_196]
    mov     word ptr [bp+var_17C], ax
    mov     word ptr [bp+var_17C+2], dx
    les     bx, [bp+var_17C]
    mov     al, es:[bx]
    mov     byte_463E4, al
    mov     al, es:[bx+1]
    mov     byte_463E5, al
    mov     al, es:[bx+2]
    mov     byte_463E6, al
    mov     al, es:[bx+3]
    mov     byte_463E7, al
    mov     ax, 0AC74h
    push    ax
    push    [bp+var_28]
    push    [bp+var_2A]
    call    locate_shape_1
    add     sp, 6
    mov     bx, [bp+var_196]
    mov     [bx+6DD4h], ax
    mov     [bx+6DD6h], dx
    inc     si
    cmp     si, 0BAh ; '�'
    jge     short loc_2A50D
    jmp     loc_2A451
loc_2A50D:
    mov     [bp+var_DA], 0FFh
    mov     [bp+var_2C], 0FFh
    mov     [bp+var_32], 1
    mov     [bp+var_184], 1
    mov     [bp+var_A], 1
    mov     [bp+var_36], 0FFh
    mov     [bp+var_188], 1
    mov     [bp+var_C6], 1
    mov     [bp+var_30], 1
    mov     [bp+var_38], 0
    mov     [bp+var_34], 0
    mov     [bp+var_190], 0
    mov     [bp+var_18], 0
    mov     [bp+var_18D], 0
    mov     [bp+var_8], 0
    mov     [bp+var_18C], 0
    mov     [bp+var_C2], 0
    mov     [bp+var_12], 0
    mov     al, byte_45D90
    mov     [bp+var_18E], al
    mov     al, byte_45E16
    mov     [bp+var_180], al
    mov     [bp+var_17F], 7
    call    sub_28F7C
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 16h
    push    ax
    mov     ax, 66h ; 'f'
    push    ax
    mov     ax, 3
    push    ax
    mov     ax, 0D9h ; '�'
    push    ax
    mov     ax, 34D2h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
    push    word_407F0
    push    word_407EE
    push    word_407EC
    mov     ax, 0BEh ; '�'
    push    ax
    mov     ax, 0CEh ; '�'
    push    ax
    sub     ax, ax
    push    ax
    mov     ax, 5
    push    ax
    call    sub_2916E
    add     sp, 0Eh
    push    word_407F0
    push    word_407EE
    push    word_407EC
    mov     ax, 9Eh ; '�'
    push    ax
    mov     ax, 66h ; 'f'
    push    ax
    mov     ax, 20h ; ' '
    push    ax
    mov     ax, 0D9h ; '�'
    push    ax
    call    sub_2916E
    add     sp, 0Eh
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 0Eh
    push    ax
    mov     ax, 5Eh ; '^'
    push    ax
    mov     ax, 8Ch ; '�'
    push    ax
    mov     ax, 0DDh ; '�'
    push    ax
    mov     ax, 34D6h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 0Eh
    push    ax
    mov     ax, 2Eh ; '.'
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax
    mov     ax, 0DDh ; '�'
    push    ax
    mov     ax, 34DAh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 0Eh
    push    ax
    mov     ax, 2Eh ; '.'
    push    ax
    mov     ax, 0ACh ; '�'
    push    ax
    mov     ax, 0DDh ; '�'
    push    ax
    mov     ax, 34DEh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 0Eh
    push    ax
    mov     ax, 2Eh ; '.'
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax
    mov     ax, 10Dh
    push    ax
    mov     ax, 34E2h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
    sub     ax, ax
    push    ax
    push    word_407F8
    push    word_407F6
    push    word_407F4
    mov     ax, 0Eh
    push    ax
    mov     ax, 2Eh ; '.'
    push    ax
    mov     ax, 0ACh ; '�'
    push    ax
    mov     ax, 10Dh
    push    ax
    mov     ax, 34E6h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    call    sub_292DC
    add     sp, 14h
loc_2A720:
    cmp     [bp+var_A], 0
    jnz     short loc_2A72F
    mov     al, [bp+var_2C]
    cmp     [bp+var_C6], al
    jz      short loc_2A775
loc_2A72F:
    mov     [bp+var_14], 1
    mov     [bp+var_6], 1
    mov     [bp+var_C4], 0
    cmp     [bp+var_C6], 0
    jz      short loc_2A775
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, [bx+20A3h]
    cbw
    cmp     ax, 1
    jz      short loc_2A76C
    cmp     ax, 2
    jz      short loc_2A7C0
    cmp     ax, 3
    jz      short loc_2A7CC
    jmp     short loc_2A775
    ; align 2
    db 144
loc_2A76C:
    mov     [bp+var_6], 2
    mov     [bp+var_C4], 1
loc_2A775:
    cmp     [bp+var_34], 0
    jz      short loc_2A77E
    jmp     loc_2A851
loc_2A77E:
    cmp     [bp+var_18E], 1Dh
    jnz     short loc_2A78F
    cmp     [bp+var_14], 2
    jnz     short loc_2A78F
    dec     [bp+var_18E]
loc_2A78F:
    cmp     [bp+var_180], 1Dh
    jnz     short loc_2A7A0
    cmp     [bp+var_6], 2
    jnz     short loc_2A7A0
    dec     [bp+var_180]
loc_2A7A0:
    mov     al, [bp+var_8]
    cbw
    mov     cx, ax
    mov     al, [bp+var_18E]
    cbw
    sub     ax, cx
    mov     cx, ax
    mov     al, [bp+var_14]
    cbw
    add     cx, ax
    cmp     cx, 0Ch
    jle     short loc_2A7DF
    inc     [bp+var_8]
    jmp     short loc_2A7A0
    ; align 2
    db 144
loc_2A7C0:
    mov     [bp+var_C4], 2
    mov     [bp+var_14], 2
    jmp     short loc_2A775
    ; align 2
    db 144
loc_2A7CC:
    mov     [bp+var_14], 2
    mov     [bp+var_6], 2
    mov     [bp+var_C4], 3
    jmp     short loc_2A775
    ; align 2
    db 144
loc_2A7DC:
    dec     [bp+var_8]
loc_2A7DF:
    mov     al, [bp+var_8]
    cbw
    mov     cx, ax
    mov     al, [bp+var_18E]
    cbw
    cmp     ax, cx
    jl      short loc_2A7DC
    jmp     short loc_2A7F4
loc_2A7F0:
    inc     [bp+var_18C]
loc_2A7F4:
    mov     al, [bp+var_18C]
    cbw
    mov     cx, ax
    mov     al, [bp+var_180]
    cbw
    sub     ax, cx
    mov     cx, ax
    mov     al, [bp+var_6]
    cbw
    add     cx, ax
    cmp     cx, 0Bh
    jg      short loc_2A7F0
    jmp     short loc_2A816
    ; align 2
    db 144
loc_2A812:
    dec     [bp+var_18C]
loc_2A816:
    mov     al, [bp+var_18C]
    cbw
    mov     cx, ax
    mov     al, [bp+var_180]
    cbw
    cmp     ax, cx
    jl      short loc_2A812
    mov     al, [bp+var_17E]
    cmp     [bp+var_8], al
    jnz     short loc_2A839
    mov     al, [bp+var_D8]
    cmp     [bp+var_18C], al
    jz      short loc_2A851
loc_2A839:
    mov     al, [bp+var_8]
    mov     [bp+var_17E], al
    mov     al, [bp+var_18C]
    mov     [bp+var_D8], al
    mov     [bp+var_32], 1
    mov     [bp+var_184], 1
loc_2A851:
    mov     al, [bp+var_C6]
    cmp     [bp+var_2C], al
    jnz     short loc_2A85D
    jmp     loc_2A8F4
loc_2A85D:
    mov     [bp+var_A], 1
    mov     [bp+var_2C], al
    jmp     short loc_2A878
loc_2A866:
    cmp     byte ptr [bp+var_196], 0FFh
    jnz     short loc_2A874
    dec     [bp+var_18D]
    jmp     short loc_2A878
    ; align 2
    db 144
loc_2A874:
    dec     [bp+var_17F]
loc_2A878:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     byte ptr [bp+var_196], al
    cmp     al, 0FEh ; '�'
    jnb     short loc_2A866
    call    sub_28F6A
    mov     al, [bp+var_C6]
    cbw
    push    ax
    push    cs
    call    near ptr sub_2BEB6
    add     sp, 2
    cmp     [bp+var_C6], 0
    jnz     short loc_2A8CA
    mov     ax, 1
    push    ax
    push    ax
    sub     ax, ax
    jmp     short loc_2A8D8
    ; align 2
    db 144
loc_2A8CA:
    mov     ax, 0Ah
    push    ax
    mov     ax, 1
    push    ax
    mov     al, [bp+var_C6]
    cbw
    dec     ax
loc_2A8D8:
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 85h ; '�'
    push    ax
    mov     ax, 5Fh ; '_'
    push    ax
    mov     ax, 0DDh ; '�'
    push    ax
    sub     ax, ax
    push    ax
    call    sub_28B0E
    add     sp, 10h
loc_2A8F4:
    cmp     [bp+var_30], 0
    jz      short loc_2A905
    mov     [bp+var_30], 0
    push    cs
    call    near ptr sub_2C81C
    mov     [bp+var_12], al
loc_2A905:
    cmp     [bp+var_32], 0
    jnz     short loc_2A914
    cmp     [bp+var_A], 0
    jnz     short loc_2A914
    jmp     loc_2AB0E
loc_2A914:
    call    sub_28F6A
    cmp     [bp+var_32], 0
    jnz     short loc_2A922
    jmp     loc_2A9CD
loc_2A922:
    mov     [bp+var_32], 0
    cmp     [bp+var_184], 0
    jz      short loc_2A983
    mov     [bp+var_184], 0
    mov     ax, 1Eh
    push    ax
    mov     ax, 0Ch
    push    ax
    mov     al, [bp+var_8]
    cbw
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 0B5h ; '�'
    push    ax
    mov     ax, 0C0h ; '�'
    push    ax
    mov     ax, 9
    push    ax
    sub     ax, ax
    push    ax
    call    sub_28B0E
    add     sp, 10h
    mov     ax, 1Eh
    push    ax
    mov     ax, 0Bh
    push    ax
    mov     al, [bp+var_18C]
    cbw
    push    ax
    mov     ax, 0B0h ; '�'
    push    ax
    mov     ax, 4
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 0CAh ; '�'
    push    ax
    sub     ax, ax
    push    ax
    call    sub_28B0E
    add     sp, 10h
loc_2A983:
    mov     ax, 0B3h ; '�'
    push    ax
    mov     ax, 4
    push    ax
    mov     ax, 0C8h ; '�'
    push    ax
    mov     ax, 8
    push    ax
    call    set_sprite1_size
    add     sp, 8
    lea     ax, [bp+var_BE]
    push    ax
    lea     ax, [bp+var_162]
    push    ax
    mov     al, [bp+var_18C]
    cbw
    push    ax
    mov     al, [bp+var_8]
    cbw
    push    ax
    push    cs
    call    near ptr sub_2C0A8
    add     sp, 8
    mov     ax, 0C8h ; '�'
    push    ax
    sub     ax, ax
    push    ax
    mov     ax, 140h
    push    ax
    sub     ax, ax
    push    ax
    call    set_sprite1_size
    add     sp, 8
loc_2A9CD:
    cmp     [bp+var_A], 0
    jnz     short loc_2A9D6
    jmp     loc_2AAF0
loc_2A9D6:
    mov     [bp+var_A], 0
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    add     bx, bp
    push    word ptr [bx-170h]
    push    word ptr [bx-172h]
    call    set_sprite1
    add     sp, 4
    cmp     [bp+var_C6], 0
    jz      short loc_2AA01
    jmp     loc_2AA8E
loc_2AA01:
    sub     ax, ax
    push    ax
    push    ax
    mov     bl, [bp+var_190]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33D30
    add     sp, 8
    push    word_40800
    sub     ax, ax
    push    ax
    mov     ax, 0Fh
    push    ax
    sub     ax, ax
    push    ax
    mov     ax, 1
    push    ax
    call    sub_2FDDE
    add     sp, 0Ah
    push    word_40800
    mov     ax, 0Eh
    push    ax
    mov     ax, 0Fh
    push    ax
    mov     ax, 0Eh
    push    ax
    mov     ax, 1
    push    ax
    call    sub_2FDDE
    add     sp, 0Ah
    push    word_40800
    mov     ax, 0Eh
    push    ax
    mov     ax, 1
    push    ax
    sub     ax, ax
    push    ax
    mov     ax, 1
    push    ax
    call    sub_2FDDE
    add     sp, 0Ah
    push    word_40800
    mov     ax, 0Eh
    push    ax
    mov     ax, 0Fh
    push    ax
    sub     ax, ax
    push    ax
    mov     ax, 0Fh
    push    ax
    call    sub_2FDDE
    add     sp, 0Ah
    jmp     short loc_2AAF0
    ; align 2
    db 144
loc_2AA8E:
    sub     ax, ax
    push    ax
    push    ax
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70BEh]
    push    word ptr [bx+70BCh]
    call    sub_33D30
    add     sp, 8
    cmp     [bp+var_190], 0
    jz      short loc_2AAF0
    sub     ax, ax
    push    ax
    push    ax
    mov     bl, [bp+var_190]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33A1E
    add     sp, 8
    sub     ax, ax
    push    ax
    push    ax
    mov     bl, [bp+var_190]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6AEAh]
    push    word ptr [bx+6AE8h]
    call    sub_34212
    add     sp, 8
loc_2AAF0:
    mov     al, [bp+var_36]
    cbw
    push    ax
    push    word ptr wndsprite+2
    push    word ptr wndsprite
    call    sub_29620
    add     sp, 6
    mov     [bp+var_36], 0FEh ; '�'
    mov     [bp+var_C2], 0FFh
loc_2AB0E:
    call    sub_28F3C
    cmp     [bp+var_34], 0
    jz      short loc_2AB1C
    jmp     loc_2ABEA
loc_2AB1C:
    mov     al, [bp+var_14]
    mov     cl, 4
    shl     al, cl
    mov     [bp+var_2E], al
    mov     al, [bp+var_6]
    shl     al, cl
    mov     [bp+var_1A], al
    mov     al, [bp+var_18E]
    cbw
    mov     [bp+var_196], ax
    mov     al, [bp+var_8]
    cbw
    mov     dx, [bp+var_196]
    sub     dx, ax
    shl     dx, cl
    add     dx, 8
    mov     [bp+var_CA], dx
    mov     al, [bp+var_180]
    cbw
    mov     [bp+var_194], ax
    mov     al, [bp+var_18C]
    cbw
    mov     dx, [bp+var_194]
    sub     dx, ax
    shl     dx, cl
    add     dx, 4
    mov     [bp+var_DC], dx
    mov     bx, [bp+var_194]
    shl     bx, 1
    mov     bx, [bx-5A30h]
    add     bx, [bp+var_196]
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx]
    mov     [bp+var_182], al
    sub     ah, ah
    cmp     ax, 0FDh ; '�'
    jz      short loc_2AB98
    cmp     ax, 0FEh ; '�'
    jz      short loc_2ABBC
    cmp     ax, 0FFh
    jz      short loc_2ABDA
    jmp     loc_2AD2B
loc_2AB98:
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A32h]
loc_2ABA5:
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     al, es:[bx-1]
loc_2ABB4:
    mov     [bp+var_182], al
    jmp     loc_2AD2B
    ; align 2
    db 144
loc_2ABBC:
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A32h]
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     al, es:[bx]
    jmp     short loc_2ABB4
    ; align 2
    db 144
loc_2ABDA:
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    jmp     short loc_2ABA5
    ; align 2
    db 144
loc_2ABEA:
    mov     [bp+var_2E], 10h
    mov     [bp+var_1A], 10h
    mov     al, [bp+var_17F]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    mov     [bp+var_DC], ax
    cmp     [bp+var_17F], 6
    jnz     short loc_2AC1A
    mov     [bp+var_CA], 0DCh ; '�'
    mov     [bp+var_1A], 8
    mov     [bp+var_2E], 60h ; '`'
    jmp     loc_2AD1F
loc_2AC1A:
    cmp     [bp+var_17F], 7
    jnz     short loc_2AC38
    sub     [bp+var_DC], 8
    mov     [bp+var_18D], 0
    mov     [bp+var_CA], 0DCh ; '�'
    mov     [bp+var_2E], 60h ; '`'
    jmp     loc_2AD1A
loc_2AC38:
    cmp     [bp+var_17F], 7
    jle     short loc_2AC6E
    sub     [bp+var_DC], 8
    cmp     [bp+var_18D], 3
    jge     short loc_2AC52
    mov     [bp+var_18D], 0
    jmp     short loc_2AC57
loc_2AC52:
    mov     [bp+var_18D], 3
loc_2AC57:
    mov     al, [bp+var_18D]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 0DCh ; '�'
    mov     [bp+var_CA], ax
    mov     [bp+var_2E], 30h ; '0'
    jmp     loc_2AD1A
loc_2AC6E:
    mov     al, [bp+var_18D]
    cbw
    mov     [bp+var_196], ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 0DCh ; '�'
    mov     [bp+var_CA], ax
    cmp     [bp+var_17F], 5
    jge     short loc_2ACB5
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    add     bx, [bp+var_196]
    add     bx, word_42540
    mov     es, word_42542
    cmp     byte ptr es:[bx+6], 0FEh ; '�'
    jnz     short loc_2ACB5
    mov     [bp+var_1A], 20h ; ' '
loc_2ACB5:
    cmp     [bp+var_18D], 5
    jge     short loc_2ACEB
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    cmp     byte ptr es:[bx+1], 0FFh
    jnz     short loc_2ACEB
    mov     [bp+var_2E], 20h ; ' '
loc_2ACEB:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     [bp+var_182], al
    cmp     al, 0FDh ; '�'
    jb      short loc_2AD1F
loc_2AD1A:
    mov     [bp+var_182], 0
loc_2AD1F:
    cmp     [bp+var_C6], 0
    jnz     short loc_2AD2B
    mov     [bp+var_182], 0
loc_2AD2B:
    mov     al, [bp+var_C2]
    cmp     [bp+var_182], al
    jnz     short loc_2AD38
    jmp     loc_2ADF4
loc_2AD38:
    call    sub_28DB6
    sub     ax, ax
    push    ax
    push    word_407CA
    call    sub_34B0C
    add     sp, 4
    mov     al, [bp+var_182]
    sub     ah, ah
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    add     ax, [bp+var_D2]
    mov     dx, [bp+var_D0]
    mov     word ptr [bp+var_17C], ax
    mov     word ptr [bp+var_17C+2], dx
    les     bx, [bp+var_17C]
    mov     al, es:[bx]
    mov     byte_463E4, al
    mov     al, es:[bx+1]
    mov     byte_463E5, al
    mov     al, es:[bx+2]
    mov     byte_463E6, al
    mov     ax, 0AC74h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 0AC74h
    push    ax
    call    copy_string
    add     sp, 6
    mov     ax, 0AC74h
    push    ax
    call    sub_32843
    add     sp, 2
    mov     si, ax
    mov     ax, 0C0h ; '�'
    push    ax
    mov     ax, 8
    push    ax
    mov     ax, 0AC74h
    push    ax
    call    sub_345BC
    add     sp, 6
    cmp     [bp+var_38], si
    jle     short loc_2ADE4
    sub     ax, ax
    push    ax
    mov     ax, 8
    push    ax
    mov     ax, [bp+var_38]
    sub     ax, si
    push    ax
    mov     ax, 0C0h ; '�'
    push    ax
    lea     ax, [si+8]
    push    ax
    call    sub_335D2
    add     sp, 0Ah
loc_2ADE4:
    call    sub_28D9E
    mov     [bp+var_38], si
    mov     al, [bp+var_182]
    mov     [bp+var_C2], al
loc_2ADF4:
    cmp     [bp+var_12], 0
    jz      short loc_2AE36
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     al, [bp+var_12]
    cbw
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    add     ax, 351Ah
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     [bp+var_12], 0
loc_2AE36:
    mov     [bp+var_3A], 63h ; 'c'
    mov     [bp+var_CC], 0
    call    sub_28DB6
    mov     al, [bp+var_34]
    mov     [bp+var_16], al
    or      al, al
    jnz     short loc_2AE73
    push    [bp+var_DC]
    push    [bp+var_CA]
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+711Ah]
    push    word ptr [bx+7118h]
    call    sub_3475A
    add     sp, 8
loc_2AE73:
    cmp     [bp+var_3A], 0Fh
    jg      short loc_2AE7C
    jmp     loc_2AF0E
loc_2AE7C:
    call    sub_28DB6
    cmp     [bp+var_34], 0
    jnz     short loc_2AED6
    cmp     [bp+var_CC], 0
    jz      short loc_2AEB4
    push    [bp+var_DC]
    push    [bp+var_CA]
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+711Ah]
    push    word ptr [bx+7118h]
loc_2AEA9:
    call    sub_33D30
    add     sp, 8
    jmp     short loc_2AEFF
    ; align 2
    db 144
loc_2AEB4:
    push    [bp+var_DC]
    push    [bp+var_CA]
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    add     bx, bp
    les     bx, [bx-172h]
    push    word ptr es:[bx+2]
    push    word ptr es:[bx]
    jmp     short loc_2AEA9
loc_2AED6:
    push    word_407F2
    mov     al, [bp+var_1A]
    cbw
    add     ax, [bp+var_DC]
    dec     ax
    push    ax
    mov     al, [bp+var_2E]
    cbw
    add     ax, [bp+var_CA]
    push    ax
    mov     ax, [bp+var_DC]
    dec     ax
    push    ax
    push    [bp+var_CA]
    call    sub_3702E
    add     sp, 0Ah
loc_2AEFF:
    call    sub_28D9E
    xor     byte ptr [bp+var_CC], 1
    mov     [bp+var_3A], 0
loc_2AF0E:
    call    get_timerdelta2
    mov     di, ax
    add     [bp+var_3A], di
    push    di
    call    input_checking
    add     sp, 2
    mov     [bp+var_C8], ax
    mov     ax, 3584h
    push    ax
    mov     ax, 357Ah
    push    ax
    mov     ax, 3570h
    push    ax
    mov     ax, 3566h
    push    ax
    mov     ax, 5
    push    ax
    call    sub_28E90
    add     sp, 0Ah
    mov     [bp+var_18A], al
    cmp     al, 0FFh
    jz      short loc_2AFC8
    cbw
    or      ax, ax
    jz      short loc_2AF70
    cmp     ax, 1
    jnz     short loc_2AF56
    jmp     loc_2B038
loc_2AF56:
    cmp     ax, 2
    jnz     short loc_2AF5E
    jmp     loc_2B088
loc_2AF5E:
    cmp     ax, 3
    jnz     short loc_2AF66
    jmp     loc_2B0E2
loc_2AF66:
    cmp     ax, 4
    jnz     short loc_2AF6E
    jmp     loc_2B1B0
loc_2AF6E:
    jmp     short loc_2AFBC
loc_2AF70:
    test    byte ptr word_442E8, 3
    jz      short loc_2AFBC
    mov     [bp+var_34], 0
    mov     ax, 1Eh
    push    ax
    mov     ax, 0Ch
    push    ax
    mov     al, [bp+var_8]
    cbw
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 0B5h ; '�'
    push    ax
    mov     ax, 0C0h ; '�'
    push    ax
    mov     ax, 9
    push    ax
    mov     ax, 1
    push    ax
    call    sub_28B0E
    add     sp, 10h
    mov     [bp+var_186], al
    sub     al, [bp+var_8]
    add     [bp+var_18E], al
    mov     al, [bp+var_186]
    mov     [bp+var_8], al
loc_2AFB6:
    mov     [bp+var_C8], 1
loc_2AFBC:
    cmp     [bp+var_C8], 1
    jnz     short loc_2AFC8
    mov     [bp+var_DA], 0FFh
loc_2AFC8:
    cmp     [bp+var_C8], 0
    jnz     short loc_2AFDB
    cmp     [bp+var_18], 0
    jz      short loc_2AFDB
    mov     [bp+var_C8], 1
loc_2AFDB:
    cmp     [bp+var_C8], 0
    jnz     short loc_2AFE5
    jmp     loc_2AE73
loc_2AFE5:
    cmp     [bp+var_18], 0
    jz      short loc_2AFF9
    mov     ax, 0Ah
    cwd
    push    dx
    push    ax
    call    sub_32805
    add     sp, 4
loc_2AFF9:
    cmp     [bp+var_CC], 0
    jnz     short loc_2B003
    jmp     loc_2B2D4
loc_2B003:
    call    sub_28DB6
    cmp     [bp+var_16], 0
    jz      short loc_2B011
    jmp     loc_2B2A6
loc_2B011:
    push    [bp+var_DC]
    push    [bp+var_CA]
    mov     al, [bp+var_C4]
    cbw
    mov     bx, ax
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+711Ah]
    push    word ptr [bx+7118h]
    call    sub_33D30
    add     sp, 8
    jmp     loc_2B2CF
    ; align 2
    db 144
loc_2B038:
    test    byte ptr word_442E8, 3
    jnz     short loc_2B042
    jmp     loc_2AFBC
loc_2B042:
    mov     [bp+var_34], 0
    mov     ax, 1Eh
    push    ax
    mov     ax, 0Bh
    push    ax
    mov     al, [bp+var_18C]
    cbw
    push    ax
    mov     ax, 0B0h ; '�'
    push    ax
    mov     ax, 4
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 0CAh ; '�'
    push    ax
    mov     ax, 1
    push    ax
    call    sub_28B0E
    add     sp, 10h
    mov     [bp+var_186], al
    sub     al, [bp+var_18C]
    add     [bp+var_180], al
    mov     al, [bp+var_186]
    mov     [bp+var_18C], al
    jmp     loc_2AFB6
    ; align 2
    db 144
loc_2B088:
    cmp     [bp+var_34], 1
    jnz     short loc_2B095
    cmp     [bp+var_17F], 6
    jz      short loc_2B0A4
loc_2B095:
    mov     [bp+var_34], 1
    mov     [bp+var_17F], 6
    mov     [bp+var_C8], 1
loc_2B0A4:
    test    byte ptr word_442E8, 3
    jnz     short loc_2B0AE
    jmp     loc_2AFBC
loc_2B0AE:
    mov     ax, 0Ah
    push    ax
    mov     ax, 1
    push    ax
    mov     al, [bp+var_C6]
    cbw
    dec     ax
    push    ax
    mov     ax, 5
    push    ax
    mov     ax, 85h ; '�'
    push    ax
    mov     ax, 5Fh ; '_'
    push    ax
    mov     ax, 0DDh ; '�'
    push    ax
    mov     ax, 1
    push    ax
    call    sub_28B0E
    add     sp, 10h
    inc     al
    mov     [bp+var_C6], al
    jmp     loc_2AFB6
loc_2B0E2:
    mov     ax, word_4616C
    sub     ax, 8
    cwd
    xor     ax, dx
    sub     ax, dx
    mov     cx, 4
    sar     ax, cl
    xor     ax, dx
    sub     ax, dx
    mov     [bp+var_D6], al
    mov     ax, word_461CE
    sub     ax, cx
    cwd
    xor     ax, dx
    sub     ax, dx
    sar     ax, cl
    xor     ax, dx
    sub     ax, dx
    mov     [bp+var_174], al
    cmp     [bp+var_C6], 0
    jz      short loc_2B15A
    cmp     al, 0Ah
    jnz     short loc_2B136
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 1
    jz      short loc_2B136
    dec     [bp+var_174]
loc_2B136:
    cmp     [bp+var_D6], 0Bh
    jnz     short loc_2B15A
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 2
    jz      short loc_2B15A
    dec     [bp+var_D6]
loc_2B15A:
    mov     al, [bp+var_8]
    add     [bp+var_D6], al
    mov     al, [bp+var_18C]
    add     [bp+var_174], al
    cmp     [bp+var_34], 0
    jnz     short loc_2B183
    mov     al, [bp+var_D6]
    cmp     [bp+var_18E], al
    jnz     short loc_2B183
    mov     al, [bp+var_174]
    cmp     [bp+var_180], al
    jz      short loc_2B19D
loc_2B183:
    mov     [bp+var_34], 0
    mov     al, [bp+var_D6]
    mov     [bp+var_18E], al
    mov     al, [bp+var_174]
    mov     [bp+var_180], al
loc_2B197:
    mov     [bp+var_C8], 1
loc_2B19D:
    cmp     [bp+var_C8], 20h ; ' '
    jz      short loc_2B1A7
    jmp     loc_2AFBC
loc_2B1A7:
    mov     [bp+var_C8], 0Dh
    jmp     loc_2AFBC
loc_2B1B0:
    mov     ax, word_4616C
    sub     ax, 0DCh ; '�'
    cwd
    xor     ax, dx
    sub     ax, dx
    mov     cx, 4
    sar     ax, cl
    xor     ax, dx
    sub     ax, dx
    mov     [bp+var_D6], al
    mov     ax, word_461CE
    sub     ax, 24h ; '$'
    cwd
    xor     ax, dx
    sub     ax, dx
    sar     ax, cl
    xor     ax, dx
    sub     ax, dx
    mov     [bp+var_174], al
    cmp     al, 6
    jl      short loc_2B1E4
    jmp     loc_2B274
loc_2B1E4:
    cbw
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    shl     ax, 1
    mov     cx, ax
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    mov     bx, ax
    add     bx, cx
    mov     al, [bp+var_D6]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    cmp     byte ptr es:[bx], 0FEh ; '�'
    jnz     short loc_2B212
    dec     [bp+var_174]
loc_2B212:
    mov     al, [bp+var_174]
    cbw
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    shl     ax, 1
    mov     cx, ax
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    mov     bx, ax
    add     bx, cx
    mov     al, [bp+var_D6]
    cbw
    add     bx, ax
    add     bx, word_42540
    cmp     byte ptr es:[bx], 0FFh
    jnz     short loc_2B240
    dec     [bp+var_D6]
loc_2B240:
    cmp     [bp+var_34], 0
    jz      short loc_2B25D
    mov     al, [bp+var_D6]
    cmp     [bp+var_18D], al
    jnz     short loc_2B25D
    mov     al, [bp+var_174]
    cmp     [bp+var_17F], al
    jnz     short loc_2B25D
    jmp     loc_2B19D
loc_2B25D:
    mov     al, [bp+var_D6]
    mov     [bp+var_18D], al
    mov     al, [bp+var_174]
    mov     [bp+var_17F], al
    mov     [bp+var_34], 1
    jmp     loc_2B197
loc_2B274:
    mov     ax, word_461CE
    sub     ax, 1Ch
    cwd
    xor     ax, dx
    sub     ax, dx
    mov     cx, 4
    sar     ax, cl
    xor     ax, dx
    sub     ax, dx
    mov     [bp+var_174], al
    cmp     al, 7
    jnz     short loc_2B298
loc_2B290:
    mov     [bp+var_D6], 0
    jmp     short loc_2B240
    ; align 2
    db 144
loc_2B298:
    cmp     [bp+var_D6], 3
    jl      short loc_2B290
    mov     [bp+var_D6], 3
    jmp     short loc_2B240
loc_2B2A6:
    push    word_407F2
    mov     al, [bp+var_1A]
    cbw
    add     ax, [bp+var_DC]
    dec     ax
    push    ax
    mov     al, [bp+var_2E]
    cbw
    add     ax, [bp+var_CA]
    push    ax
    mov     ax, [bp+var_DC]
    dec     ax
    push    ax
    push    [bp+var_CA]
    call    sub_3702E
    add     sp, 0Ah
loc_2B2CF:
    call    sub_28D9E
loc_2B2D4:
    cmp     [bp+var_18], 0
    jz      short loc_2B356
    cmp     [bp+var_C8], 1
    jnz     short loc_2B2E7
    cmp     [bp+var_34], 0
    jz      short loc_2B2EE
loc_2B2E7:
    mov     ax, word_45DD0
    dec     ax
    mov     [bp+var_18], ax
loc_2B2EE:
    mov     bx, [bp+var_18]
    add     bx, word ptr trackdata21
    mov     es, word ptr trackdata21+2
    mov     al, es:[bx]
    mov     [bp+var_18E], al
    mov     bx, [bp+var_18]
    add     bx, word ptr trackdata22
    mov     es, word ptr trackdata22+2
    mov     al, es:[bx]
    mov     [bp+var_180], al
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx]
    mov     [bp+var_190], al
    mov     [bp+var_32], 1
    mov     [bp+var_A], 1
    inc     [bp+var_18]
    mov     ax, word_45DD0
    cmp     [bp+var_18], ax
    jge     short loc_2B347
    jmp     loc_2A720
loc_2B347:
    mov     al, [bp+var_1E]
    mov     [bp+var_190], al
    mov     [bp+var_18], 0
    jmp     loc_2A720
loc_2B356:
    mov     [bp+var_18], 0
    sub     si, si
    jmp     short loc_2B361
    ; align 2
    db 144
loc_2B360:
    inc     si
loc_2B361:
    cmp     si, 0Ah
    jge     short loc_2B382
    mov     bx, si
    shl     bx, 1
    mov     ax, [bp+var_C8]
    cmp     [bx+354Eh], ax
    jnz     short loc_2B360
    mov     ax, si
    inc     al
    mov     [bp+var_C6], al
    mov     [bp+var_C8], 0
loc_2B382:
    mov     ax, [bp+var_C8]
    cmp     ax, 63h ; 'c'
    jz      short loc_2B3EA
    jbe     short loc_2B390
    jmp     loc_2BDFE
loc_2B390:
    cmp     ax, 0Dh
    jnz     short loc_2B398
    jmp     loc_2B49A
loc_2B398:
    cmp     ax, 20h ; ' '
    jz      short loc_2B3B0
    cmp     ax, 2Bh ; '+'
    jz      short loc_2B3CA
    cmp     ax, 2Dh ; '-'
    jz      short loc_2B3B8
    cmp     ax, 43h ; 'C'
    jz      short loc_2B3EA
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B3B0:
    xor     [bp+var_34], 1
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B3B8:
    cmp     [bp+var_C6], 1
    jg      short loc_2B3C2
    jmp     loc_2BE3A
loc_2B3C2:
    dec     [bp+var_C6]
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B3CA:
    cmp     [bp+var_C6], 0Ah
    jl      short loc_2B3D4
    jmp     loc_2BE3A
loc_2B3D4:
    inc     [bp+var_C6]
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B3DC:
    mov     [bp+var_C6], 0
    mov     [bp+var_190], 0
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B3EA:
    call    setup_track
    cbw
    mov     si, ax
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, si
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    add     ax, 351Ah
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    push    ax
    call    show_dialog
    add     sp, 12h
    cmp     si, 1
    jle     short loc_2B491
    mov     [bp+var_34], 0
    cmp     word_45DD0, 0
    jnz     short loc_2B448
    mov     al, byte_45D90
    mov     [bp+var_18E], al
    mov     al, byte_45E16
    mov     [bp+var_180], al
    jmp     short loc_2B491
loc_2B448:
    les     bx, trackdata21
    mov     al, es:[bx]
    mov     [bp+var_18E], al
    les     bx, trackdata22
    mov     al, es:[bx]
    mov     [bp+var_180], al
    mov     al, [bp+var_190]
    mov     [bp+var_1E], al
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx]
    mov     [bp+var_190], al
    mov     [bp+var_18], 1
    mov     [bp+var_A], 1
loc_2B491:
    call    check_input
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2B49A:
    cmp     [bp+var_34], 0
    jnz     short loc_2B4A3
    jmp     loc_2B8EE
loc_2B4A3:
    cmp     [bp+var_17F], 6
    jl      short loc_2B4AD
    jmp     loc_2B544
loc_2B4AD:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     [bp+var_190], al
    cmp     [bp+var_C6], 0
    jz      short loc_2B53A
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 1
    jz      short loc_2B50B
    mov     al, [bp+var_18C]
    cbw
    mov     cx, ax
    mov     al, [bp+var_180]
    cbw
    sub     ax, cx
    cmp     ax, 0Ah
    jnz     short loc_2B50B
    dec     [bp+var_180]
loc_2B50B:
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 2
    jz      short loc_2B53A
    mov     al, [bp+var_8]
    cbw
    mov     cx, ax
    mov     al, [bp+var_18E]
    cbw
    sub     ax, cx
    cmp     ax, 0Bh
    jnz     short loc_2B53A
    dec     [bp+var_18E]
loc_2B53A:
    inc     [bp+var_A]
    mov     [bp+var_34], 0
    jmp     loc_2B491
loc_2B544:
    mov     [bp+var_30], 1
    cmp     [bp+var_17F], 6
    jnz     short loc_2B566
    inc     [bp+var_C6]
    cmp     [bp+var_C6], 0Ah
    jg      short loc_2B55D
    jmp     loc_2B491
loc_2B55D:
    mov     [bp+var_C6], 1
    jmp     loc_2B491
    ; align 2
    db 144
loc_2B566:
    cmp     [bp+var_17F], 7
    jnz     short loc_2B5C6
    les     bx, trackdata14
    mov     al, es:[bx+384h]
    sub     ah, ah
    push    ax
    sub     ax, ax
    push    ax
    push    word_40802
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 34EAh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    mov     ax, 2
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     [bp+var_C], al
    cmp     al, 0FFh
    jnz     short loc_2B5B3
    jmp     loc_2B491
loc_2B5B3:
    cmp     al, 5
    jnz     short loc_2B5BA
    jmp     loc_2B491
loc_2B5BA:
    les     bx, trackdata14
    mov     es:[bx+384h], al
    jmp     loc_2B668
loc_2B5C6:
    cmp     [bp+var_17F], 8
    jz      short loc_2B5D0
    jmp     loc_2B674
loc_2B5D0:
    cmp     [bp+var_18D], 0
    jnz     short loc_2B5DA
    jmp     loc_2B674
loc_2B5DA:
    sub     ax, ax
    push    ax
    push    ax
    push    word_40802
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 34EEh
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    mov     ax, 2
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     [bp+var_C], al
    cmp     al, 0FFh
    jnz     short loc_2B615
    jmp     loc_2B491
loc_2B615:
    cmp     al, 5
    jnz     short loc_2B61C
    jmp     loc_2B491
loc_2B61C:
    sub     si, si
loc_2B61E:
    les     bx, trackdata14
    mov     byte ptr es:[bx+si], 0
    inc     si
    cmp     si, 384h
    jl      short loc_2B61E
    mov     al, [bp+var_C]
    add     al, 30h ; '0'
    mov     byte_3ECBB, al
    mov     ax, 3548h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_shape_alt
    add     sp, 6
    mov     word ptr [bp+var_10], ax
    mov     word ptr [bp+var_10+2], dx
    sub     si, si
loc_2B64F:
    les     bx, [bp+var_10]
    mov     al, es:[bx+si]
    les     bx, trackdata15
    mov     es:[bx+si], al
    inc     si
    cmp     si, 385h
    jl      short loc_2B64F
    mov     byte_449B1, 0
loc_2B668:
    inc     [bp+var_32]
    mov     [bp+var_D4], 1
    jmp     loc_2B491
    ; align 2
    db 144
loc_2B674:
    cmp     [bp+var_17F], 8
    jz      short loc_2B67E
    jmp     loc_2B75C
loc_2B67E:
    cmp     [bp+var_18D], 0
    jz      short loc_2B688
    jmp     loc_2B75C
loc_2B688:
    call    sub_28F3C
    cmp     [bp+var_D4], 0
    jz      short loc_2B6CE
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 34F2h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    mov     ax, 2
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     si, ax
    or      si, si
    jnz     short loc_2B6CE
    jmp     loc_2B766
loc_2B6CE:
    mov     si, 1
    mov     byte_3B8FB, 1
    inc     [bp+var_32]
    mov     ax, 34F6h
    push    ax
    push    word_44CEE
    push    word_44CEC
    call    locate_text_res
    add     sp, 6
    push    dx              ; int
    push    ax              ; int
    mov     ax, 34FAh
    push    ax              ; int
    mov     ax, 9241h
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax              ; char *
    call    sub_27ED4
    add     sp, 0Ah
    cbw
    mov     si, ax
    mov     ax, 95F8h
    push    ax              ; char *
    mov     ax, 34FFh
    push    ax              ; int
    mov     ax, 9241h
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax              ; char *
    call    combine_file_path
    add     sp, 8
    or      si, si
    jg      short loc_2B725
    jmp     loc_2B89B
loc_2B725:
    push    word ptr trackdata14+2
    push    word ptr trackdata14
    mov     ax, 95F8h
    push    ax
    call    load_binary_file_fatal
    add     sp, 6
    call    setup_track
    mov     [bp+var_34], 0
    mov     al, byte_45E16
    mov     [bp+var_180], al
    mov     al, byte_45D90
    mov     [bp+var_18E], al
    mov     [bp+var_D4], 0
    inc     [bp+var_32]
    jmp     loc_2B89B
    ; align 2
    db 144
loc_2B75C:
    cmp     [bp+var_18D], 0
    jz      short loc_2B766
    jmp     loc_2B8A4
loc_2B766:
    mov     [bp+var_176], 0
    mov     byte_3B8FB, 1
    jmp     loc_2B891
    ; align 2
    db 144
loc_2B774:
    call    sub_28F3C
    inc     [bp+var_32]
    mov     ax, 3504h
    push    ax
    push    word_44CEE
    push    word_44CEC
    call    locate_text_res
    add     sp, 6
    push    dx              ; int
    push    ax              ; int
    mov     ax, 9241h
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax              ; char *
    call    sub_2863A
    add     sp, 8
    or      al, al
    jz      short loc_2B80D
    mov     ax, 95F8h
    push    ax              ; char *
    mov     ax, 3508h
    push    ax              ; int
    mov     ax, 9241h
    push    ax
    mov     ax, 9Ch ; '�'
    push    ax              ; char *
    call    combine_file_path
    add     sp, 8
    mov     [bp+var_176], 1
    mov     ax, 95F8h
    push    ax
    call    find_filename
    add     sp, 2
    or      ax, ax
    jz      short loc_2B812
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 350Dh
    push    ax
    push    word_44CEE
    push    word_44CEC
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    mov     ax, 2
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     si, ax
    cmp     si, 0FFFFh
    jnz     short loc_2B880
loc_2B80D:
    mov     [bp+var_176], 0FFh
loc_2B812:
    cmp     [bp+var_176], 1
    jnz     short loc_2B891
    mov     ax, 70Ah
    cwd
    push    dx
    push    ax
    push    word ptr trackdata14+2
    push    word ptr trackdata14
    mov     ax, 95F8h
    push    ax
    call    sub_3250B
    add     sp, 0Ah
    mov     si, ax
    or      si, si
    jnz     short loc_2B845
    mov     ax, 1
    push    ax
    call    sub_11588
    add     sp, 2
loc_2B845:
    or      si, si
    jz      short loc_2B88C
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 3511h
    push    ax
    push    word_44CEE
    push    word_44CEC
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     [bp+var_176], 0
    jmp     short loc_2B891
loc_2B880:
    or      si, si
    jnz     short loc_2B812
    mov     [bp+var_176], 0
    jmp     short loc_2B812
    ; align 2
    db 144
loc_2B88C:
    mov     [bp+var_D4], 0
loc_2B891:
    cmp     [bp+var_176], 0
    jnz     short loc_2B89B
    jmp     loc_2B774
loc_2B89B:
    mov     byte_3B8FB, 0
    jmp     loc_2B491
    ; align 2
    db 144
loc_2B8A4:
    cmp     [bp+var_D4], 0
    jz      short loc_2B8E5
    sub     ax, ax
    push    ax
    push    ax
    push    word_40800
    mov     ax, 0FFFFh
    push    ax
    push    ax
    mov     ax, 3515h
    push    ax
    push    [bp+var_20]
    push    [bp+var_22]
    call    locate_text_res
    add     sp, 6
    push    dx
    push    ax
    mov     ax, 1
    push    ax
    mov     ax, 2
    push    ax
    call    show_dialog
    add     sp, 12h
    mov     si, ax
    or      si, si
    jnz     short loc_2B8E5
    jmp     loc_2B766
loc_2B8E5:
    mov     [bp+var_188], 0
    jmp     loc_2B491
    ; align 2
    db 144
loc_2B8EE:
    cmp     [bp+var_C6], 0
    jz      short loc_2B8F8
    jmp     loc_2B98E
loc_2B8F8:
    mov     al, [bp+var_DA]
    cmp     [bp+var_18E], al
    jnz     short loc_2B928
    mov     al, [bp+var_C0]
    cmp     [bp+var_180], al
    jnz     short loc_2B928
    mov     al, [bp+var_190]
    mov     [bp+var_1C], al
    mov     al, [bp+var_192]
    mov     [bp+var_190], al
    mov     al, [bp+var_1C]
    mov     [bp+var_192], al
    inc     [bp+var_A]
    jmp     short loc_2B95B
    ; align 2
    db 144
loc_2B928:
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-73C4h]
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     al, es:[bx]
    mov     [bp+var_192], al
    mov     al, [bp+var_18E]
    mov     [bp+var_DA], al
    mov     al, [bp+var_180]
    mov     [bp+var_C0], al
loc_2B95B:
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-73C4h]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     al, [bp+var_190]
    mov     es:[bx], al
    mov     [bp+var_D4], 1
    mov     [bp+var_30], 1
    inc     [bp+var_32]
    jmp     loc_2B491
    ; align 2
    db 144
loc_2B98E:
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 1
    jz      short loc_2B9B1
    cmp     [bp+var_180], 1Ch
    jle     short loc_2B9B1
    jmp     loc_2B491
loc_2B9B1:
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    test    byte ptr [bx+20A3h], 2
    jz      short loc_2B9D4
    cmp     [bp+var_18E], 1Ch
    jle     short loc_2B9D4
    jmp     loc_2B491
loc_2B9D4:
    mov     al, [bp+var_DA]
    cmp     [bp+var_18E], al
    jnz     short loc_2BA04
    mov     al, [bp+var_C0]
    cmp     [bp+var_180], al
    jnz     short loc_2BA04
    mov     al, [bp+var_190]
    mov     [bp+var_1C], al
    mov     al, [bp+var_192]
    mov     [bp+var_190], al
    mov     al, [bp+var_1C]
    mov     [bp+var_192], al
    inc     [bp+var_A]
    jmp     short loc_2BA40
    ; align 2
    db 144
loc_2BA04:
    mov     al, [bp+var_180]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_18E]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx]
    mov     [bp+var_192], al
    cmp     al, 0FDh ; '�'
    jb      short loc_2BA30
    mov     [bp+var_192], 0
loc_2BA30:
    mov     al, [bp+var_18E]
    mov     [bp+var_DA], al
    mov     al, [bp+var_180]
    mov     [bp+var_C0], al
loc_2BA40:
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, [bp+var_190]
    mov     es:[bx], al
    mov     [bp+var_D4], 1
    mov     [bp+var_30], 1
    inc     [bp+var_32]
    mov     al, [bp+var_190]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, [bx+20A3h]
    cbw
    cmp     ax, 1
    jz      short loc_2BA98
    cmp     ax, 2
    jz      short loc_2BABC
    cmp     ax, 3
    jz      short loc_2BAE0
    jmp     loc_2B491
loc_2BA98:
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A2Eh]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     byte ptr es:[bx], 0FEh ; '�'
    jmp     loc_2B491
    ; align 2
    db 144
loc_2BABC:
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     byte ptr es:[bx+1], 0FFh
    jmp     loc_2B491
loc_2BAE0:
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     byte ptr es:[bx+1], 0FFh
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A2Eh]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     byte ptr es:[bx], 0FEh ; '�'
    mov     al, [bp+var_C0]
    cbw
    mov     bx, ax
    shl     bx, 1
    mov     bx, [bx-5A2Eh]
    mov     al, [bp+var_DA]
    cbw
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     byte ptr es:[bx+1], 0FDh ; '�'
    jmp     loc_2B491
    ; align 2
    db 144
loc_2BB46:
    cmp     [bp+var_34], 0
    jz      short loc_2BB54
    mov     [bp+var_17F], 0
    jmp     loc_2BCC8
loc_2BB54:
    mov     al, [bp+var_18C]
    cmp     [bp+var_180], al
    jnz     short loc_2BB70
    mov     al, [bp+var_8]
    cmp     [bp+var_18E], al
    jnz     short loc_2BB70
    mov     [bp+var_8], 0
    mov     [bp+var_18C], 0
loc_2BB70:
    mov     al, [bp+var_18C]
    mov     [bp+var_180], al
    mov     al, [bp+var_8]
    mov     [bp+var_18E], al
    jmp     loc_2BE3A
loc_2BB82:
    mov     al, [bp+var_34]
    cbw
    add     ax, bp
    sub     ax, 180h
    mov     [bp+var_196], ax
    mov     bx, ax
    cmp     byte ptr [bx], 0
    jnz     short loc_2BB99
    jmp     loc_2BE3A
loc_2BB99:
    mov     [bp+var_DA], 0FFh
    dec     byte ptr [bx]
    cmp     [bp+var_34], 0
    jnz     short loc_2BBA9
    jmp     loc_2BE3A
loc_2BBA9:
    cmp     [bp+var_17F], 6
    jl      short loc_2BBB3
    jmp     loc_2BE3A
loc_2BBB3:
    jmp     short loc_2BBD3
    ; align 2
    db 144
loc_2BBB6:
    mov     al, byte ptr [bp+var_196]
    mov     [bp+var_178], al
    cmp     al, 0FFh
    jnz     short loc_2BBC8
    dec     [bp+var_18D]
    jmp     short loc_2BBD3
loc_2BBC8:
    cmp     [bp+var_178], 0FEh ; '�'
    jnz     short loc_2BBD3
    dec     [bp+var_17F]
loc_2BBD3:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     byte ptr [bp+var_196], al
    cmp     al, 0FEh ; '�'
    jnb     short loc_2BBB6
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2BC06:
    mov     al, [bp+var_34]
    cbw
    mov     [bp+var_196], ax
    mov     bx, ax
    mov     al, [bx+3590h]
    add     bx, bp
    cmp     [bx-180h], al
    jb      short loc_2BC1F
    jmp     loc_2BE3A
loc_2BC1F:
    mov     [bp+var_DA], 0FFh
    mov     bx, [bp+var_196]
    add     bx, bp
    inc     byte ptr [bx-180h]
    cmp     [bp+var_34], 0
    jnz     short loc_2BC37
    jmp     loc_2BE3A
loc_2BC37:
    cmp     [bp+var_17F], 6
    jl      short loc_2BC41
    jmp     loc_2BE3A
loc_2BC41:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     [bp+var_178], al
    cmp     al, 0FFh
    jnz     short loc_2BC78
    dec     [bp+var_18D]
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2BC78:
    cmp     [bp+var_178], 0FEh ; '�'
    jz      short loc_2BC82
    jmp     loc_2BE3A
loc_2BC82:
    inc     [bp+var_17F]
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2BC8A:
    cmp     [bp+var_34], 0
    jz      short loc_2BC9A
    cmp     [bp+var_17F], 6
    jnz     short loc_2BC9A
    jmp     loc_2B3B8
loc_2BC9A:
    mov     al, [bp+var_34]
    cbw
    add     ax, bp
    sub     ax, 18Eh
    mov     [bp+var_196], ax
    mov     bx, ax
    cmp     byte ptr [bx], 0
    jnz     short loc_2BCB1
    jmp     loc_2BE3A
loc_2BCB1:
    mov     [bp+var_DA], 0FFh
    dec     byte ptr [bx]
    cmp     [bp+var_34], 0
    jnz     short loc_2BCC1
    jmp     loc_2BE3A
loc_2BCC1:
    cmp     [bp+var_17F], 5
    jle     short loc_2BCED
loc_2BCC8:
    mov     [bp+var_18D], 0
    jmp     loc_2BE3A
loc_2BCD0:
    mov     al, byte ptr [bp+var_196]
    mov     [bp+var_178], al
    cmp     al, 0FFh
    jnz     short loc_2BCE2
    dec     [bp+var_18D]
    jmp     short loc_2BCED
loc_2BCE2:
    cmp     [bp+var_178], 0FEh ; '�'
    jnz     short loc_2BCED
    dec     [bp+var_17F]
loc_2BCED:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     byte ptr [bp+var_196], al
    cmp     al, 0FEh ; '�'
    jnb     short loc_2BCD0
    jmp     loc_2BE3A
    ; align 2
    db 144
loc_2BD20:
    cmp     [bp+var_34], 0
    jz      short loc_2BD30
    cmp     [bp+var_17F], 6
    jnz     short loc_2BD30
    jmp     loc_2B3CA
loc_2BD30:
    mov     [bp+var_178], 1
    cmp     [bp+var_34], 0
    jnz     short loc_2BD3E
    jmp     loc_2BDC8
loc_2BD3E:
    cmp     [bp+var_17F], 5
    jle     short loc_2BD9B
    mov     [bp+var_178], 3
    jmp     short loc_2BDC8
    db 144
    db 144
loc_2BD4E:
    mov     al, [bp+var_17F]
    cbw
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, 24h ; '$'
    imul    [bp+var_C6]
    add     bx, ax
    mov     al, [bp+var_18D]
    cbw
    add     bx, ax
    add     bx, [bp+var_196]
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx]
    mov     byte ptr [bp+var_198], al
    cmp     al, 0FEh ; '�'
    jb      short loc_2BDC8
    mov     [bp+var_186], al
    cmp     al, 0FFh
    jnz     short loc_2BD90
    inc     [bp+var_178]
    jmp     short loc_2BD9B
    ; align 2
    db 144
loc_2BD90:
    cmp     [bp+var_186], 0FEh ; '�'
    jnz     short loc_2BD9B
    dec     [bp+var_17F]
loc_2BD9B:
    mov     al, [bp+var_178]
    sub     ah, ah
    mov     [bp+var_196], ax
    mov     al, [bp+var_34]
    cbw
    mov     [bp+var_194], ax
    mov     bx, ax
    add     bx, bp
    mov     al, [bx-18Eh]
    cbw
    add     ax, [bp+var_196]
    mov     bx, [bp+var_194]
    mov     cl, [bx+358Eh]
    sub     ch, ch
    cmp     ax, cx
    jb      short loc_2BD4E
loc_2BDC8:
    mov     al, [bp+var_34]
    cbw
    mov     [bp+var_198], ax
    mov     bx, ax
    add     bx, bp
    mov     al, [bx-18Eh]
    cbw
    mov     cl, [bp+var_178]
    sub     ch, ch
    add     ax, cx
    mov     bx, [bp+var_198]
    mov     cl, [bx+358Eh]
    cmp     ax, cx
    jnb     short loc_2BE3A
    mov     [bp+var_DA], 0FFh
    add     bx, bp
    mov     al, [bp+var_178]
    add     [bx-18Eh], al
    jmp     short loc_2BE3A
loc_2BDFE:
    cmp     ax, 4B00h
    jnz     short loc_2BE06
    jmp     loc_2BC8A
loc_2BE06:
    ja      short loc_2BE1A
    cmp     ax, 4700h
    jnz     short loc_2BE10
    jmp     loc_2BB46
loc_2BE10:
    cmp     ax, 4800h
    jnz     short loc_2BE18
    jmp     loc_2BB82
loc_2BE18:
    jmp     short loc_2BE3A
loc_2BE1A:
    cmp     ax, 4D00h
    jnz     short loc_2BE22
    jmp     loc_2BD20
loc_2BE22:
    cmp     ax, 5000h
    jnz     short loc_2BE2A
    jmp     loc_2BC06
loc_2BE2A:
    cmp     ax, 5200h
    jnz     short loc_2BE32
    jmp     loc_2B3B0
loc_2BE32:
    cmp     ax, 5400h
    jnz     short loc_2BE3A
    jmp     loc_2B3DC
loc_2BE3A:
    cmp     [bp+var_188], 0
    jz      short loc_2BE44
    jmp     loc_2A720
loc_2BE44:
    push    word ptr wndsprite+2
    push    word ptr wndsprite
    call    sub_324AA
    add     sp, 4
    push    [bp+var_164]
    push    [bp+var_166]
    call    sub_324AA
    add     sp, 4
    push    [bp+var_168]
    push    [bp+var_16A]
    call    sub_324AA
    add     sp, 4
    push    [bp+var_16C]
    push    [bp+var_16E]
    call    sub_324AA
    add     sp, 4
    push    [bp+var_170]
    push    [bp+var_172]
    call    sub_324AA
    add     sp, 4
    push    [bp+var_20]
    push    [bp+var_22]
    call    unload_resource
    add     sp, 4
    push    [bp+var_28]
    push    [bp+var_2A]
    call    mmgr_free
    add     sp, 4
    pop     si
    pop     di
    mov     sp, bp
    pop     bp
    retf
sub_2A2BC endp
sub_2BEB6 proc far
    var_6 = byte ptr -6
    var_4 = byte ptr -4
    var_2 = byte ptr -2
     s = byte ptr 0
     r = byte ptr 2
    arg_0 = byte ptr 6

    push    bp
    mov     bp, sp
    sub     sp, 6
    push    si
    mov     [bp+var_2], 0
    jmp     loc_2C095
loc_2BEC4:
    cmp     [bp+var_6], 0FDh ; '�'
    jb      short loc_2BECD
    jmp     loc_2BFAC
loc_2BECD:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0DCh ; '�'
    push    ax
    push    word_4283E
    push    word_4283C
    call    sub_33D30
    add     sp, 8
    mov     al, [bp+var_6]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, [bx+20A3h]
    cbw
    cmp     ax, 1
    jz      short loc_2BF22
    cmp     ax, 2
    jnz     short loc_2BF18
    jmp     loc_2C01A
loc_2BF18:
    cmp     ax, 3
    jnz     short loc_2BF20
    jmp     loc_2C034
loc_2BF20:
    jmp     short loc_2BF4A
loc_2BF22:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 34h ; '4'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0DCh ; '�'
loc_2BF39:
    push    ax
    push    word_4283E
    push    word_4283C
    call    sub_33D30
    add     sp, 8
loc_2BF4A:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0DCh ; '�'
    push    ax
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33A1E
    add     sp, 8
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0DCh ; '�'
    push    ax
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6AEAh]
    push    word ptr [bx+6AE8h]
    call    sub_34212
loc_2BFA9:
    add     sp, 8
loc_2BFAC:
    inc     [bp+var_4]
loc_2BFAF:
    cmp     [bp+var_4], 6
    jb      short loc_2BFB8
    jmp     loc_2C092
loc_2BFB8:
    mov     al, [bp+var_4]
    sub     ah, ah
    mov     si, ax
    mov     al, [bp+var_2]
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    shl     ax, 1
    mov     cx, ax
    mov     al, 24h ; '$'
    mul     [bp+arg_0]
    mov     bx, ax
    add     bx, cx
    add     bx, word_42540
    mov     es, word_42542
    mov     al, es:[bx+si]
    mov     [bp+var_6], al
    cmp     [bp+arg_0], 0
    jz      short loc_2BFEC
    jmp     loc_2BEC4
loc_2BFEC:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 0DCh ; '�'
    push    ax
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33D30
    jmp     short loc_2BFA9
    ; align 2
    db 144
loc_2C01A:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
loc_2C026:
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0ECh ; '�'
    jmp     loc_2BF39
loc_2C034:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 24h ; '$'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0ECh ; '�'
    push    ax
    push    word_4283E
    push    word_4283C
    call    sub_33D30
    add     sp, 8
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 34h ; '4'
    push    ax
    mov     al, [bp+var_4]
    sub     ah, ah
    shl     ax, cl
    add     ax, 0DCh ; '�'
    push    ax
    push    word_4283E
    push    word_4283C
    call    sub_33D30
    add     sp, 8
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     cl, 4
    shl     ax, cl
    add     ax, 34h ; '4'
    jmp     short loc_2C026
loc_2C092:
    inc     [bp+var_2]
loc_2C095:
    cmp     [bp+var_2], 6
    jnb     short loc_2C0A2
    mov     [bp+var_4], 0
    jmp     loc_2BFAF
loc_2C0A2:
    pop     si
    mov     sp, bp
    pop     bp
    retf
    ; align 2
    db 144
sub_2BEB6 endp
sub_2C0A8 proc far
    var_E = word ptr -14
    var_C = byte ptr -12
    var_A = byte ptr -10
    var_8 = byte ptr -8
    var_6 = byte ptr -6
    var_4 = word ptr -4
    var_2 = word ptr -2
     s = byte ptr 0
     r = byte ptr 2
    arg_0 = byte ptr 6
    arg_2 = byte ptr 8
    arg_4 = word ptr 10
    arg_6 = word ptr 12

    push    bp
    mov     bp, sp
    sub     sp, 0Eh
    push    di
    push    si
    mov     [bp+var_6], 0
    jmp     loc_2C7F7
    ; align 2
    db 144
loc_2C0B8:
    cmp     [bp+var_C], 0FEh ; '�'
    jz      short loc_2C0C1
    jmp     loc_2C21A
loc_2C0C1:
    cmp     [bp+var_6], 0
    jz      short loc_2C0CA
    jmp     loc_2C21A
loc_2C0CA:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 18h
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx+1]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    sub     ax, 0Ch
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A32h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33890
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    sub     ax, 0Ch
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A32h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     bl, es:[bx]
loc_2C201:
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6AEAh]
    push    word ptr [bx+6AE8h]
    call    sub_34084
loc_2C214:
    add     sp, 8
    jmp     loc_2C63E
loc_2C21A:
    cmp     [bp+var_C], 0FDh ; '�'
    jz      short loc_2C223
    jmp     loc_2C63E
loc_2C223:
    cmp     [bp+var_6], 0
    jz      short loc_2C22C
    jmp     loc_2C63E
loc_2C22C:
    cmp     [bp+var_8], 0
    jz      short loc_2C235
    jmp     loc_2C63E
loc_2C235:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    sub     ax, 0Ch
    push    ax
    mov     ax, si
    shl     ax, cl
    sub     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A32h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     bl, es:[bx-1]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33890
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    sub     ax, 0Ch
    push    ax
    mov     ax, si
    shl     ax, cl
    sub     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A32h]
loc_2C305:
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     bl, es:[bx-1]
    jmp     loc_2C201
    ; align 2
    db 144
loc_2C31E:
    cmp     [bp+var_C], 0
    jnz     short loc_2C382
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_4]
    cmp     byte ptr [bx+si], 0
    jnz     short loc_2C33C
    mov     si, [bp+arg_6]
    mov     al, [bp+var_A]
    cmp     [bx+si], al
    jnz     short loc_2C33C
    jmp     loc_2C63E
loc_2C33C:
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_A]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33D30
    add     sp, 8
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_4]
    mov     byte ptr [bx+si], 0
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_6]
    mov     al, [bp+var_A]
    mov     [bx+si], al
    jmp     loc_2C63E
loc_2C382:
    cmp     [bp+var_C], 0FDh ; '�'
    jb      short loc_2C38B
    jmp     loc_2C62C
loc_2C38B:
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_4]
    mov     al, [bp+var_C]
    cmp     [bx+si], al
    jnz     short loc_2C3A5
    mov     si, [bp+arg_6]
    mov     al, [bp+var_A]
    cmp     [bx+si], al
    jnz     short loc_2C3A5
    jmp     loc_2C63E
loc_2C3A5:
    mov     si, [bp+arg_4]
    mov     al, [bp+var_C]
    mov     [bx+si], al
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_6]
    mov     al, [bp+var_A]
    mov     [bx+si], al
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_A]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33D30
    add     sp, 8
    mov     al, [bp+var_C]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, [bx+20A3h]
    cbw
    or      ax, ax
    jz      short loc_2C41A
    cmp     ax, 1
    jz      short loc_2C478
    cmp     ax, 2
    jnz     short loc_2C40E
    jmp     loc_2C516
loc_2C40E:
    cmp     ax, 3
    jnz     short loc_2C416
    jmp     loc_2C558
loc_2C416:
    jmp     loc_2C63E
    ; align 2
    db 144
loc_2C41A:
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_C]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33A1E
    add     sp, 8
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_C]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6AEAh]
    push    word ptr [bx+6AE8h]
    call    sub_34212
    jmp     loc_2C214
loc_2C478:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 14h
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C2h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
loc_2C4B5:
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_C]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33890
    add     sp, 8
    mov     al, [bp+var_6]
    cbw
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     al, [bp+var_8]
    cbw
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+var_C]
    jmp     loc_2C201
loc_2C516:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 18h
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
loc_2C53F:
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx+1]
    jmp     loc_2C4B5
    ; align 2
    db 144
loc_2C558:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 18h
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx+1]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 14h
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C2h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 14h
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 18h
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C2h]
    jmp     loc_2C53F
    ; align 2
    db 144
loc_2C62C:
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_4]
    mov     byte ptr [bx+si], 0FFh
    mov     bx, [bp+var_4]
    mov     si, [bp+arg_6]
    mov     byte ptr [bx+si], 0FFh
loc_2C63E:
    inc     [bp+var_8]
loc_2C641:
    cmp     [bp+var_8], 0Ch
    jl      short loc_2C64A
    jmp     loc_2C7F4
loc_2C64A:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+arg_0]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_6]
    cbw
    mov     cl, [bp+arg_2]
    sub     ch, ch
    add     ax, cx
    shl     ax, 1
    mov     [bp+var_E], ax
    mov     bx, ax
    mov     bx, [bx-5A30h]
    add     bx, si
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx+di]
    mov     [bp+var_C], al
    mov     bx, [bp+var_E]
    mov     bx, [bx-73C4h]
    add     bx, si
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     al, es:[bx+di]
    mov     [bp+var_A], al
    mov     ax, [bp+var_2]
    add     ax, si
    mov     [bp+var_4], ax
    cmp     [bp+var_C], 0FDh ; '�'
    jnb     short loc_2C6A5
    jmp     loc_2C31E
loc_2C6A5:
    cmp     [bp+var_6], ch
    jz      short loc_2C6B2
    cmp     [bp+var_8], ch
    jz      short loc_2C6B2
    jmp     loc_2C31E
loc_2C6B2:
    mov     bx, [bp+var_4]
    add     bx, [bp+arg_4]
    mov     byte ptr [bx], 0FFh
    cmp     [bp+var_C], 0FFh
    jz      short loc_2C6C4
    jmp     loc_2C0B8
loc_2C6C4:
    cmp     [bp+var_8], 0
    jz      short loc_2C6CD
    jmp     loc_2C0B8
loc_2C6CD:
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C4h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 14h
    push    ax
    mov     ax, si
    shl     ax, cl
    add     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-73C2h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     bl, es:[bx]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+70CEh]
    push    word ptr [bx+70CCh]
    call    sub_33BBC
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    sub     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A30h]
    add     bx, si
    mov     al, [bp+arg_0]
    sub     ah, ah
    add     bx, ax
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     bl, es:[bx-1]
    sub     bh, bh
    shl     bx, 1
    shl     bx, 1
    push    word ptr [bx+6DD6h]
    push    word ptr [bx+6DD4h]
    call    sub_33890
    add     sp, 8
    mov     al, [bp+var_8]
    cbw
    mov     si, ax
    mov     al, [bp+var_6]
    cbw
    mov     di, ax
    mov     cl, 4
    shl     ax, cl
    add     ax, 4
    push    ax
    mov     ax, si
    shl     ax, cl
    sub     ax, 8
    push    ax
    mov     bl, [bp+arg_2]
    sub     bh, bh
    add     bx, di
    shl     bx, 1
    mov     bx, [bx-5A30h]
    jmp     loc_2C305
    ; align 2
    db 144
loc_2C7F4:
    inc     [bp+var_6]
loc_2C7F7:
    cmp     [bp+var_6], 0Bh
    jge     short loc_2C816
    mov     al, [bp+var_6]
    cbw
    mov     cx, ax
    shl     ax, 1
    add     ax, cx
    shl     ax, 1
    shl     ax, 1
    mov     [bp+var_2], ax
    mov     [bp+var_8], 0
    jmp     loc_2C641
    ; align 2
    db 144
loc_2C816:
    pop     si
    pop     di
    mov     sp, bp
    pop     bp
    retf
sub_2C0A8 endp
sub_2C81C proc far
    var_A = byte ptr -10
    var_8 = byte ptr -8
    var_6 = byte ptr -6
    var_4 = byte ptr -4
    var_2 = byte ptr -2
     s = byte ptr 0
     r = byte ptr 2

    push    bp
    mov     bp, sp
    sub     sp, 0Ah
    push    di
    push    si
    push    cs
    call    near ptr sub_2C9B4
    mov     [bp+var_A], 0
    mov     [bp+var_6], 0
    jmp     loc_2C993
    ; align 2
    db 144
loc_2C834:
    cmp     [bp+var_4], 0FFh
    jnz     short loc_2C848
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     si, [bx-5A30h]
    jmp     short loc_2C87B
    ; align 2
    db 144
loc_2C848:
    cmp     [bp+var_4], 0FEh ; '�'
    jnz     short loc_2C86A
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     bx, [bx-5A32h]
    mov     al, [bp+var_2]
    sub     ah, ah
    add     bx, ax
    les     si, trackdata14
    mov     al, es:[bx+si]
    jmp     short loc_2C88A
    ; align 2
    db 144
loc_2C86A:
    cmp     [bp+var_4], 0FDh ; '�'
    jnz     short loc_2C88D
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     si, [bx-5A32h]
loc_2C87B:
    mov     al, [bp+var_2]
    sub     ah, ah
    add     si, ax
    les     bx, trackdata14
    mov     al, es:[bx+si-1]
loc_2C88A:
    mov     [bp+var_4], al
loc_2C88D:
    mov     al, [bp+var_4]
    sub     ah, ah
    cmp     ax, 22h ; '"'
    jb      short loc_2C8B0
    cmp     ax, 23h ; '#'
    jbe     short loc_2C903
    cmp     ax, 67h ; 'g'
    jb      short loc_2C8B0
    cmp     ax, 6Ch ; 'l'
    jbe     short loc_2C903
    cmp     ax, 0ABh ; '�'
    jb      short loc_2C8B0
    cmp     ax, 0AEh ; '�'
    jbe     short loc_2C903
loc_2C8B0:
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_2]
    sub     ah, ah
    add     bx, ax
    les     si, trackdata14
    mov     es:[bx+si], ah
    mov     [bp+var_A], 0Ch
    jmp     short loc_2C903
    ; align 2
    db 144
loc_2C8D0:
    mov     al, [bp+var_4]
    sub     ah, ah
    push    ax
    mov     al, [bp+var_8]
    push    ax
    call    map_terrain_track
    add     sp, 4
    or      al, al
    jnz     short loc_2C903
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_2]
    sub     ah, ah
    add     bx, ax
    les     si, trackdata14
    mov     es:[bx+si], ah
    mov     [bp+var_A], 0Dh
loc_2C903:
    inc     [bp+var_2]
loc_2C906:
    cmp     [bp+var_2], 1Eh
    jb      short loc_2C90F
    jmp     loc_2C990
loc_2C90F:
    mov     al, [bp+var_2]
    sub     ah, ah
    mov     si, ax
    mov     al, [bp+var_6]
    mov     di, ax
    shl     di, 1
    mov     bx, [di-73C4h]
    add     bx, word ptr trackdata15
    mov     es, word ptr trackdata15+2
    mov     al, es:[bx+si]
    mov     [bp+var_8], al
    mov     bx, [di-5A30h]
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    mov     al, es:[bx+si]
    mov     [bp+var_4], al
    cmp     al, ah
    jz      short loc_2C903
    cmp     [bp+var_8], ah
    jz      short loc_2C903
    cmp     [bp+var_8], 6
    jz      short loc_2C903
    mov     al, [bp+var_8]
    cmp     ax, 1
    jb      short loc_2C96D
    cmp     ax, 5
    ja      short loc_2C960
    jmp     loc_2C834
loc_2C960:
    cmp     ax, 7
    jb      short loc_2C96D
    cmp     ax, 0Ah
    ja      short loc_2C96D
    jmp     loc_2C8D0
loc_2C96D:
    mov     [bp+var_A], 0Eh
    mov     bl, [bp+var_6]
    sub     bh, bh
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_2]
    sub     ah, ah
    add     bx, ax
    mov     si, word ptr trackdata14
    mov     es:[bx+si], ah
    jmp     loc_2C903
    ; align 4
    db 144
    db 144
    db 144
loc_2C990:
    inc     [bp+var_6]
loc_2C993:
    cmp     [bp+var_6], 1Eh
    jnb     short loc_2C9A0
    mov     [bp+var_2], 0
    jmp     loc_2C906
loc_2C9A0:
    cmp     [bp+var_A], 0
    jz      short loc_2C9AA
    push    cs
    call    near ptr sub_2C9B4
loc_2C9AA:
    mov     al, [bp+var_A]
    cbw
    pop     si
    pop     di
    mov     sp, bp
    pop     bp
    retf
sub_2C81C endp
sub_2C9B4 proc far
    var_392 = dword ptr -914
    var_38E = word ptr -910
    var_38C = byte ptr -908
    var_38A = byte ptr -906
    var_388 = byte ptr -904
    var_384 = byte ptr -900
    var_383 = byte ptr -899
     s = byte ptr 0
     r = byte ptr 2

    push    bp
    mov     bp, sp
    sub     sp, 392h
    push    di
    push    si
    sub     si, si
loc_2C9BF:
    mov     [bp+si+var_384], 0
    inc     si
    cmp     si, 384h
    jl      short loc_2C9BF
    mov     [bp+var_38C], 0
    jmp     loc_2CC3C
    ; align 2
    db 144
loc_2C9D4:
    mov     al, [bp+var_38A]
    sub     ah, ah
    mov     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    add     bx, ax
    shl     bx, 1
    mov     al, [bx+20A3h]
    cbw
    cmp     ax, 1
    jz      short loc_2CA02
    cmp     ax, 2
    jnz     short loc_2C9F8
    jmp     loc_2CABC
loc_2C9F8:
    cmp     ax, 3
    jnz     short loc_2CA00
    jmp     loc_2CB30
loc_2CA00:
    jmp     short loc_2CA79
loc_2CA02:
    mov     al, [bp+var_388]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_38C]
    shl     ax, 1
    mov     [bp+var_38E], ax
    mov     bx, ax
    mov     bx, [bx-5A2Eh]
    add     bx, di
    add     bx, bp
    cmp     byte ptr [bx-384h], 0
    jz      short loc_2CA2A
    mov     bx, ax
    jmp     loc_2CB7E
loc_2CA2A:
    mov     al, [bp+var_388]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_38C]
    shl     ax, 1
    mov     [bp+var_38E], ax
    mov     bx, ax
    mov     bx, [bx-5A2Eh]
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    cmp     byte ptr es:[bx+di], 0FEh ; '�'
    jz      short loc_2CA60
    mov     bx, ax
    mov     bx, [bx-5A30h]
    add     bx, word ptr trackdata14
loc_2CA5A:
    mov     byte ptr es:[bx+di], 0
    jmp     short loc_2CA79
loc_2CA60:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     di, [bx-5A2Eh]
    mov     al, [bp+var_388]
    sub     ah, ah
    add     di, ax
    mov     [bp+di+var_384], 1
loc_2CA79:
    inc     [bp+var_388]
loc_2CA7D:
    cmp     [bp+var_388], 1Eh
    jb      short loc_2CA87
    jmp     loc_2CC38
loc_2CA87:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     di, [bx-5A30h]
    mov     al, [bp+var_388]
    sub     ah, ah
    add     di, ax
    les     bx, trackdata14
    mov     al, es:[bx+di]
    mov     [bp+var_38A], al
    cmp     al, ah
    jz      short loc_2CA79
    cmp     al, 0FDh ; '�'
    jnb     short loc_2CAB1
    jmp     loc_2C9D4
loc_2CAB1:
    cmp     [bp+di+var_384], ah
    jnz     short loc_2CA79
loc_2CAB7:
    mov     es:[bx+di], ah
    jmp     short loc_2CA79
loc_2CABC:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     di, [bx-5A30h]
    mov     al, [bp+var_388]
    sub     ah, ah
    add     di, ax
    cmp     [bp+di+var_383], ah
    jz      short loc_2CADE
    les     bx, trackdata14
    jmp     loc_2CA5A
    ; align 2
    db 144
loc_2CADE:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     ax, [bx-5A30h]
    mov     cl, [bp+var_388]
    sub     ch, ch
    add     ax, cx
    add     ax, word ptr trackdata14
    mov     dx, word ptr trackdata14+2
    mov     word ptr [bp+var_392], ax
    mov     word ptr [bp+var_392+2], dx
    les     bx, [bp+var_392]
    cmp     byte ptr es:[bx+1], 0FFh
    jz      short loc_2CB14
    mov     es:[bx], ch
    jmp     loc_2CA79
    ; align 2
    db 144
loc_2CB14:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     di, [bx-5A30h]
    mov     al, [bp+var_388]
    sub     ah, ah
    add     di, ax
    mov     [bp+di+var_383], 1
    jmp     loc_2CA79
loc_2CB30:
    mov     al, [bp+var_388]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_38C]
    shl     ax, 1
    mov     word ptr [bp+var_392], ax
    mov     bx, ax
    mov     bx, [bx-5A2Eh]
    add     bx, di
    add     bx, bp
    mov     al, [bx-383h]
    sub     ah, ah
    mov     bx, word ptr [bp+var_392]
    mov     bx, [bx-5A30h]
    add     bx, di
    add     bx, bp
    mov     cl, [bx-383h]
    sub     ch, ch
    add     ax, cx
    mov     bx, word ptr [bp+var_392]
    mov     bx, [bx-5A2Eh]
    add     bx, di
    add     bx, bp
    mov     cl, [bx-384h]
    add     ax, cx
    jz      short loc_2CB8E
    mov     bx, word ptr [bp+var_392]
loc_2CB7E:
    mov     bx, [bx-5A30h]
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    jmp     loc_2CA5A
    ; align 2
    db 144
loc_2CB8E:
    mov     al, [bp+var_388]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_38C]
    shl     ax, 1
    mov     word ptr [bp+var_392], ax
    mov     bx, ax
    mov     bx, [bx-5A30h]
    add     bx, word ptr trackdata14
    mov     es, word ptr trackdata14+2
    cmp     byte ptr es:[bx+di+1], 0FFh
    jnz     short loc_2CBD6
    mov     bx, ax
    mov     bx, [bx-5A2Eh]
    add     bx, word ptr trackdata14
    cmp     byte ptr es:[bx+di], 0FEh ; '�'
    jnz     short loc_2CBD6
    mov     bx, ax
    mov     bx, [bx-5A2Eh]
    add     bx, word ptr trackdata14
    cmp     byte ptr es:[bx+di+1], 0FDh ; '�'
    jz      short loc_2CBF2
loc_2CBD6:
    mov     bl, [bp+var_38C]
    sub     bh, bh
    shl     bx, 1
    mov     bx, [bx-5A30h]
    mov     al, [bp+var_388]
    sub     ah, ah
    add     bx, ax
    mov     di, word ptr trackdata14
    jmp     loc_2CAB7
    ; align 2
    db 144
loc_2CBF2:
    mov     al, [bp+var_388]
    sub     ah, ah
    mov     di, ax
    mov     al, [bp+var_38C]
    shl     ax, 1
    mov     word ptr [bp+var_392], ax
    mov     bx, ax
    mov     bx, [bx-5A30h]
    add     bx, di
    add     bx, bp
    mov     byte ptr [bx-383h], 1
    mov     bx, word ptr [bp+var_392]
    mov     bx, [bx-5A2Eh]
    add     bx, di
    add     bx, bp
    mov     byte ptr [bx-384h], 1
    mov     bx, word ptr [bp+var_392]
    mov     bx, [bx-5A2Eh]
    add     bx, di
    add     bx, bp
    mov     byte ptr [bx-383h], 1
    jmp     loc_2CA79
loc_2CC38:
    inc     [bp+var_38C]
loc_2CC3C:
    cmp     [bp+var_38C], 1Eh
    jnb     short loc_2CC4C
loc_2CC43:
    mov     [bp+var_388], 0
loc_2CC48:
    jmp     loc_2CA7D
    ; align 2
    db 144
loc_2CC4C:
    pop     si
    pop     di
loc_2CC4E:
    mov     sp, bp
loc_2CC50:
    pop     bp
    retf
sub_2C9B4 endp
seg009 ends
end
