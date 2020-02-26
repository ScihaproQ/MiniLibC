BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8
    xor     r9, r9

init:
    mov     r8b, BYTE[rdi + rcx]
    mov     r9b, BYTE[rsi + rcx]
    jmp     set_first

loop:
    sub     r8, r9
    cmp     BYTE[rdi + rcx], 0
    je      return
    cmp     BYTE[rsi + rcx], 0
    je      return
    cmp     r8b, 0
    jne     return
    inc     rcx
    jmp     init

set_first:
    cmp     r8, 0x41
    jb      set_second
    cmp     r8, 0x5A
    ja      set_second
    add     r8, 0x20

set_second:
    cmp     r9b, 0x41
    jb      loop
    cmp     r9b, 0x5A
    ja      loop
    add     r9b, 0x20
    jmp     loop

return:
    mov     rax, r8
    mov     rsp, rbp
    pop     rbp
    ret