section .data

    codes: db '012345678ABCDEF'

section .text
global _start

_start:

    ;número 1122... em formato hexadecimal
    mov rax, 0x1122334455667788

    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
    ; Cada 4 bits devem ser exibido um dígito hexadecimal
    ; Use o deslocamento shift e a operação bit a bit AND para isolá-los
    ; o resultado é o offset no array 'codes'

.loop:

    push rax
    sub rcx, 4
    ; cl é a parte meno de rcx
    ; rax -- ax -- ah -- al
    sar rax, cl
    and rax, 0xf

    lea rsi, [codes + rax]
    mov rax, 1

    push rax
    push rcx

    ; syscall deixa rcx e r11 alterados
    pop rcx
    syscall

    pop rax

    test rcx, rcx
    jnz .loop

    mov rax, 60
    xor rdi, rdi
    syscall