BITS 64
SECTION .text
GLOBAL memcpy

memcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp rcx, rdx
    je end
    mov r8b, BYTE[rsi + rcx]
    mov BYTE[rdi + rcx], r8b
    xor r8, r8
    inc rcx
    jmp loop

return:
    mov     rsp, rbp
    pop     rbp
    ret