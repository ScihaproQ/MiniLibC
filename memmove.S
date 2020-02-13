BITS 64
SECTION .text
GLOBAL memmove

memmove:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx

loop:
	cmp     rcx, rdx
    je      return
	cmp     BYTE [rsi + rcx], 0
    je      return
    mov     r8b, BYTE [rsi + rcx]
    mov     BYTE [rdi + rcx], r8b
    inc     rcx
    jmp     loop

return:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rbp
    ret
