org 0x7C00
; sets standart code adress (0x7C00 is the bootloader adress) 

bits 16


; create halt to stop CPU from executing
main:
    hlt

; infinite loop incase CPU executes again
.halt:
     jmp .halt

; fill bootsector with 0's until 510 bytes. Bootsector has a fixed size of 510 bytes
times 510-($-$$) db 0

dw 0xAA55
;set needed booting signature
