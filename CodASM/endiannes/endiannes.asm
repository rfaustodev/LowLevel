section .data

    demo1: dq 0x1122334455667788
    demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

section .text

global _start

extern print_newline
extern print_rax

_start:

    mov rdi, [demo1]
    call print_hax
    call print_newline

    mov rdi, [demo2]
    call print_rax
    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall