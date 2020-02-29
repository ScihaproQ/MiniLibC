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

inc:
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
    jmp     inc

    rindex :
        mov rax, 0
    loop :
        cmp BYTE[rdi], 0
        je end
        cmp BYTE[rdi], sil
        je save
        inc rdi
        jmp loop
    end :
        cmp sil, 0
        je return
        ret
    return :
        mov rax, rdi
        ret
    save :
        mov rax, rdi
        inc rdi
        jmp loop