BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     rdx, rdx
    xor     r8, r8

loop:
    xor     rcx, rcx
    mov     r8b, BYTE[rdi + rdx]
    cmp     r8b, 0
    je      return

block:
    cmp     BYTE[rsi + rcx], 0
    je      inc
    cmp     r8b, BYTE[rsi + rcx]
    je      return
    inc     rcx
    jmp     block

inc:
    inc     rdx
    jmp     loop

return:
    mov     rax, rdx
    mov     rsp, rbp
    pop     rbp
    ret