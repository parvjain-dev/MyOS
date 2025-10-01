BITS 16
ORG 0x7C00

mov si, message
call print

mainloop:
    mov ah, 0   ; BIOS: wait for keypress and store ASCII in AL
    int 0x16
    mov ah, 0x0E  ; BIOS: print AL to screen
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
