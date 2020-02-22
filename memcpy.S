BITS 64
SECTION .text
GLOBAL memcpy

memcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     BYTE[rsi + rcx], 0
    je      return
    cmp     BYTE[rdi + rcx], 0
    je      return
    cmp     rdx, 0
    je      return
    mov     r9b, BYTE[rsi + rcx]
    mov     BYTE[rdi + rcx], r9b
    dec     rdx
    inc     rcx
    jmp     loop

return:
    mov     rsp, rbp
    pop     rbp
    ret