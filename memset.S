BITS 64
SECTION .text
GLOBAL asm_memset

asm_memset:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax
    xor     rcx, rcx

loop:
    cmp     BYTE[rdi + rcx], 0
    je      return
    cmp     rdx, 0
    je      return
    mov     BYTE[rdi + rcx], sil
    dec     rdx
    inc     rcx
    jmp     loop

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret