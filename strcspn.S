BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r9, r9

loop:
    cmp     BYTE[rdi], 0
    je      return
    jmp     find

inc:
    inc     rdi
    jmp     loop

return:
    mov     rax, r9
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
    inc     r9
    jmp     find