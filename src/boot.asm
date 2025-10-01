BITS 16
ORG 0x7C00

mov si, message
call print

mainloop:
    mov ah, 0   ; Wait for keypress, result in AL
    int 0x16
    mov ah, 0x0E ; Print character in AL
    int 0x10
    jmp mainloop

print:
    mov ah, 0x0E
.next_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next_char
.done:
    ret

message db 'Type a key: ',0

times 510-($-$$) db 0
dw 0xAA55
