; Multiboot header must be in the first 8 KB of the kernel image

section .multiboot
align 4
multiboot_header:
    dd 0x1BADB002         ; magic number
    dd 0x00010003         ; flags (bit 0 = required, bit 1 = memory info, bit 3 = video info)
    dd -(0x1BADB002 + 0x00010003) ; checksum (magic + flags + checksum = 0)

section .text
    global _start
_start:
    ; Your kernel code here
