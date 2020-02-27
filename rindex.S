BITS 64
SECTION .text
GLOBAL rindex

rindex:
    push    rbp
    mov     rbp, rsp

size:
    cmp     BYTE[rdi], 0
    je      return
    cmp     BYTE[rdi], sil
    je      found

to_inc:
    inc     rdi
    jmp     size

return:
    mov     rsp, rbp
    pop     rbp
    ret

found:
    mov     rax, rdi
    jmp     to_inc