BITS 64
SECTION .text
GLOBAL  strpbrk

strpbrk:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     BYTE[rdi], 0
    je      return
    jmp     find

inc:
    inc     rdi
    jmp     loop

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret

find:
    mov     r8b, BYTE[rsi + rcx]
    cmp     r8, 0
    je      inc
    cmp     BYTE[rdi], r8b
    je      return
    inc     rcx
    jmp     find