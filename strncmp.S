BITS 64
SECTION .text
GLOBAL strncmp

strncmp:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8
    xor     r9, r9
    xor     r10, r10

loop:
    cmp     rdx, 0
    je      return
    cmp     BYTE[rdi + rcx], 0
    je      return
    cmp     BYTE[rsi + rcx], 0
    je      return
    mov     r8b, BYTE[rdi + rcx]
    mov     r9b, BYTE[rsi + rcx]
    cmp     r8, r9
    jne     return
    inc     rcx
    dec     rdx
    jmp     loop

return:
    mov     r8b, BYTE[rdi + rcx]
    mov     r9b, BYTE[rsi + rcx]
    sub     r8, r9
    mov     rax, r8
    mov     rsp, rbp
    pop     rbp
    ret