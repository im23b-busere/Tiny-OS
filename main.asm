; sets standart code adress (0x7C00 is the bootloader adress)
org 0x7C00
bits 16



start:
    jmp main


; prints string on the screen
puts:
    ; save registers to modify
    push si
    push ax


.loop:
    lodsb
    or al, al
    jz .done
    
    mov ah, 0x0e        ; call bios intterrupt
    int 0x10

    jmp .loop

.done:
    pop ax
    pop si
    ret



; create halt to stop CPU from executing
main:
    mov ax, 0 ;cant write directly to ds/es
    mov ds, ax
    mov es, ax

    ;
    mov ss, ax
    mov sp, 0x7C00

    mov si, msg_hello
    call puts

    hlt



; infinite loop incase CPU executes again
.halt:
     jmp .halt

msg_hello: db 'Hello World!', 0

; fill bootsector with 0's until 510 bytes. Bootsector has a fixed size of 510 bytes
times 510-($-$$) db 0



; set needed booting signature
dw 0xAA55
