BITS 64
SECTION .text
GLOBAL  strpbrk

strpbrk:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     rax, rax
    xor     r8, r8

loop:
    cmp     BYTE[rsi], 0
    je      exit
    xor     rcx, rcx
    mov     r8b, BYTE[rsi]

find:
    cmp     BYTE[rdi + rcx], 0
    je      inc
    cmp     BYTE[rdi + rcx], r8b
    je      inc_rdi
    inc     rcx
    jmp     find

inc:
    inc     rsi
    jmp     loop

inc_rdi:
    cmp     rcx, 0
    je      return
    inc     rdi
    dec     rcx
    jmp     inc_rdi

exit:
    mov     rax, 0
    mov     rsp, rbp
    pop     rsp
    ret

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret