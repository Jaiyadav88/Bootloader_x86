[BITS 16]
[org 0x7c00]


msg:
    dw 'Hello World!',0; defined a word
section .text
_start:
    cli 
    mov ax,0x00
    mov es,ax
    mov ss,ax
    mov ds,ax
    mov sp,0x7c00
    sti
    mov si,msg

start:
    lodsb
    cmp al,0
    je done
    mov ah,0x0E
    int 0x10
    jmp start
done:
    cli
    hlt
times 510-($-$$) db 0
dw 0xaa55
