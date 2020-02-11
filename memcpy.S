BITS 64
SECTION .text
GLOBAL asm_memcpy

asm_memcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r9, r9

loop:
    cmp     BYTE[rsi + rcx], 0
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
