BITS 64
SECTION .text
GLOBAL rindex

rindex:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8

size:
    cmp     BYTE[rdi + rcx], 0
    je      to_inc
    inc     rcx
    jmp     size

to_inc:
    cmp     BYTE[rdi + rcx], sil
    je      return
    dec     rcx
    jmp     to_inc

return:
    mov     rax, rdi
    add     rax, rcx
    mov     rsp, rbp
    pop     rbp
    ret