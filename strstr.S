BITS 64
SECTION .text
GLOBAL strstr

strstr:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    xor     r8, r8
    xor     rax, rax

loop:
    cmp     BYTE[rdi], 0
    je      ext
    xor     rcx, rcx
    jmp     compare

compare:
    cmp     BYTE[rsi + rcx], 0
    je      exit
    mov     r8b, BYTE[rdi + rcx]
    cmp     r8b, BYTE[rsi + rcx]
    jne     inc
    inc     rcx
    jmp     compare

inc:
    inc     rdi
    jmp     loop

ext:
    mov     rax, 0
    mov     rsp, rbp
    pop     rbp
    ret

exit:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret
