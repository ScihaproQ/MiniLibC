BITS 64
SECTION .text
GLOBAL asm_strchr

asm_strchr:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      return
    cmp     BYTE[rdi], sil
    je      found
    inc     rdi
    jmp     loop

return:
    cmp     sil, 0
    je      found
    mov     rsp, rbp
    pop     rbp
    ret

found:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret
