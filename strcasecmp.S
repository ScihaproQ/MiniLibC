BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8
    xor     r9, r9

loop:
    mov     r8b, BYTE[rdi + rcx]
    mov     r9b, BYTE[rsi + rcx]
    cmp     r8b, 0
    je      return
    cmp     r9b, 0
    je      return
    jmp     set_first

set_first:
    cmp     r8b, 0x61
    jg      set_second
    cmp     r8b, 0x7A
    jl      set_second
    sub     r8b, 0x20

set_second:
    cmp     r9b, 0x61
    jg     compare
    cmp     r9b, 0x7A
    jl     compare
    sub     r9b, 0x20
    jmp     compare

compare:
    cmp     r8, r9
    je      return
    inc     rcx
    jmp     loop

return:
    mov     r8b, BYTE[rdi + rcx]
    mov     r9b, BYTE[rsi + rcx]
    sub     r8, r9
    mov     rax, r8
    mov     rsp, rbp
    pop     rbp
    ret