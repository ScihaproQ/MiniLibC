BITS 64
SECTION .text
GLOBAL rindex

rindex:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      check
    cmp     BYTE[rdi], sil
    je      found
    inc     rdi
    jmp     loop

check:
    cmp     sil, 0
    je      return
    ret

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret

found:
    mov     rax, rdi
    inc     rdi
    jmp     loop