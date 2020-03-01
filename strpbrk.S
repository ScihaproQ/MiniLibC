BITS 64
SECTION .text
GLOBAL  strpbrk

strpbrk:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8

loop:
    mov     al, BYTE[rdi + rcx]
    cmp     al, 0
    je      exit
    xor     r8, r8
    jmp     find

inc:
    inc     rcx
    jmp     loop

find:
    mov     dl, BYTE[rsi + r8]
    cmp     dl, 0
    je      inc
    cmp     al, dl
    je      return
    inc     r8
    jmp     find

exit:
    mov     rax, 0
    mov     rsp, rbp
    pop     rbp
    ret

return:
    mov     rax, rdi
    add     rax, rcx
    mov     rsp, rbp
    pop     rbp
    ret