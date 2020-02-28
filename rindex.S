BITS 64
SECTION .text
GLOBAL rindex

rindex:
    push    rbp
    mov     rbp, rsp

size:
    cmp     BYTE[rdi], 0
    je      check
    cmp     BYTE[rdi], sil
    je      found

check:
    cmp     sil, 0
    je      return
    ret

inc:
    inc     rdi
    jmp     size

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret

found:
    mov     rax, rdi
    jmp     inc