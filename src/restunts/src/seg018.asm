.model large
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
seg018 segment byte public 'CODE' use16
    assume cs:seg018
    assume es:nothing, ss:nothing, ds:dseg
    public sub_36AF4
    public sub_36B05
sub_36AF4 proc far

    mov     ax, 40h ; '@'
    mov     es, ax
    or      byte ptr es:17h, 20h
    call    sub_30A35
    retf
sub_36AF4 endp
sub_36B05 proc far

    mov     ax, 40h ; '@'
    mov     es, ax
    and     byte ptr es:17h, 0DFh
    call    sub_30A35
    retf
sub_36B05 endp
seg018 ends
end
