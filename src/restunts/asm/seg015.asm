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
seg015 segment byte public 'STUNTSC' use16
    assume cs:seg015
    assume es:nothing, ss:nothing, ds:dseg
    public sub_36412
sub_36412 proc far
    var_1A = word ptr -26
    var_18 = word ptr -24
    var_16 = word ptr -22
    var_14 = word ptr -20
    var_12 = word ptr -18
    var_10 = word ptr -16
    var_E = word ptr -14
    var_C = word ptr -12
    var_A = word ptr -10
    var_8 = word ptr -8
    var_6 = word ptr -6
    var_4 = word ptr -4
    var_2 = word ptr -2
     s = byte ptr 0
     r = byte ptr 2
    arg_0 = word ptr 6
    arg_2 = word ptr 8

    push    bp
    mov     bp, sp
loc_36415:
    sub     sp, 1Ah
    push    di
    push    si
loc_3641A:
    mov     bx, [bp+arg_0]
    mov     si, [bx]
    mov     ax, [bx+4]
    sub     ax, si
    mov     bx, [bp+arg_2]
    mov     [bx], ax
    mov     bx, [bp+arg_0]
    mov     ax, [bx+6]
    sub     ax, [bx+2]
    mov     bx, [bp+arg_2]
    mov     [bx+2], ax
    mov     bx, [bp+arg_0]
    mov     ax, [bx+8]
    sub     ax, si
    mov     bx, [bp+arg_2]
    mov     [bx+20h], ax
    mov     bx, [bp+arg_0]
    mov     ax, [bx+0Ah]
    sub     ax, [bx+2]
    mov     bx, [bp+arg_2]
    mov     [bx+22h], ax
    mov     ax, [bx]
    sar     ax, 1
    mov     [bp+var_2], ax
    sar     ax, 1
    mov     [bp+var_A], ax
    mov     ax, [bp+var_2]
    add     ax, [bp+var_A]
    mov     [bp+var_6], ax
    mov     ax, [bx+2]
    sar     ax, 1
    mov     [bp+var_4], ax
    sar     ax, 1
    mov     [bp+var_C], ax
    mov     ax, [bp+var_4]
    add     ax, [bp+var_C]
    mov     [bp+var_8], ax
    mov     ax, [bx+20h]
    sar     ax, 1
    mov     [bp+var_10], ax
    sar     ax, 1
    mov     [bp+var_18], ax
    mov     ax, [bp+var_10]
    add     ax, [bp+var_18]
    mov     [bp+var_14], ax
    mov     ax, [bx+22h]
    sar     ax, 1
    mov     [bp+var_12], ax
    sar     ax, 1
    mov     [bp+var_1A], ax
    mov     ax, [bp+var_12]
    add     ax, [bp+var_1A]
    mov     [bp+var_16], ax
    mov     ax, (offset sceneshapes2.scene_loshapeptr+0E1h)
    push    ax
    mov     ax, [bx+20h]
    add     ax, [bx]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+10h], ax
    mov     ax, (offset sceneshapes2.scene_loshapeptr+0E1h)
    push    ax
    mov     ax, [bx+2]
    add     ax, [bx+22h]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+12h], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx]
    add     ax, [bp+var_10]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+8], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx+2]
    add     ax, [bp+var_12]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+0Ah], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx+20h]
    add     ax, [bp+var_2]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+18h], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx+22h]
    add     ax, [bp+var_4]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+1Ah], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx]
    add     ax, [bp+var_18]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+4], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx+2]
    add     ax, [bp+var_1A]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+6], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx+20h]
    add     ax, [bp+var_A]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+1Ch], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx+22h]
    add     ax, [bp+var_C]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+1Eh], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx]
    add     ax, [bp+var_14]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+0Ch], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx+2]
    add     ax, [bp+var_16]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+0Eh], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx+20h]
    add     ax, [bp+var_6]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+14h], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx+22h]
    add     ax, [bp+var_8]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+16h], ax
    mov     ax, [bx]
    neg     ax
    mov     si, ax
    mov     ax, (offset sceneshapes2.scene_loshapeptr+0E1h)
    push    ax
    mov     ax, [bx+20h]
    add     ax, si
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+30h], ax
    mov     ax, [bx+2]
    neg     ax
    mov     di, ax
    mov     ax, (offset sceneshapes2.scene_loshapeptr+0E1h)
    push    ax
    mov     ax, [bx+22h]
    add     ax, di
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+32h], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bp+var_10]
    add     ax, si
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+38h], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bp+var_12]
    add     ax, di
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+3Ah], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx+20h]
    sub     ax, [bp+var_2]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+28h], ax
    mov     ax, offset unk_3F0AE
    push    ax
    mov     ax, [bx+22h]
    sub     ax, [bp+var_4]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+2Ah], ax
    mov     ax, [bx]
    neg     ax
    mov     si, ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bp+var_18]
    add     ax, si
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+3Ch], ax
    mov     ax, [bx+2]
    neg     ax
    mov     di, ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bp+var_1A]
    add     ax, di
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+3Eh], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx+20h]
    sub     ax, [bp+var_A]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+24h], ax
    mov     ax, offset unk_3F587
    push    ax
    mov     ax, [bx+22h]
    sub     ax, [bp+var_C]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+26h], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bp+var_14]
    add     ax, si
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+34h], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bp+var_16]
    add     ax, di
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+36h], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx+20h]
    sub     ax, [bp+var_6]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+2Ch], ax
    mov     ax, offset unk_3EAA3
    push    ax
    mov     ax, [bx+22h]
    sub     ax, [bp+var_8]
    push    ax
    call    scale_value
    add     sp, 4
    mov     bx, [bp+arg_2]
    mov     [bx+2Eh], ax
    mov     [bp+var_E], 0
loc_3677B:
    mov     si, [bp+var_E]
    mov     cl, 2
    shl     si, cl
    add     si, [bp+arg_2]
    mov     bx, [bp+arg_0]
    mov     di, [bx]
    mov     ax, di
    sub     ax, [si]
    mov     [si+40h], ax
    mov     ax, [bx+2]
    sub     ax, [si+2]
    mov     [si+42h], ax
    add     [si], di
    mov     ax, [bx+2]
    add     [si+2], ax
loc_367A2:
    inc     [bp+var_E]
loc_367A5:
    cmp     [bp+var_E], 10h
    jl      short loc_3677B
    pop     si
    pop     di
loc_367AD:
    mov     sp, bp
    pop     bp
locret_367B0:
    retf
sub_36412 endp
seg015 ends
end
