section .data

    newline_char: db 10
    codes: db '012345678abcdef'

section .text

global _start
global print_newline
global print_rax

_start:

print_newline:
    
    mov rax, 1
    mov rsi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall

ret

print_rax:

mov rax, rdi

mov rdi, 1
mov rdx, 1
mov rcx, 64

iterate:

    push rax
    sub rcx, 4
    sar rax, cl

    and rax, 0xf
    lea rsi, [codes + rax]
    mov rax, 1

    push rcx
    syscall

    pop rcx
    pop rax

    test rcx, rcx

    jnz iterate

ret

mov rax, 60
xor rdi, rdi
syscall