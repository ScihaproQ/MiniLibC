BITS 64
SECTION .text
GLOBAL rindex

rindex:
    push        rbp
    mov         rbp, rsp
    xor         rcx, rcx
    jmp         find

inc:
    inc         rcx

find:
    mov         dl, BYTE[rdi + rcx]
    cmp         dl, 0
    jne         inc
    jmp         loop

dec:
    cmp         rcx, 0
    je          end
    dec         rcx

loop:
	movsx       edx, BYTE [rdi + rcx]
	cmp         edx, esi
	jne         dec
	mov         rax, rdi
	add         rax, rcx
	jmp         return

end:
    xor         rax, rax

return:
    mov         rsp, rbp
    pop         rbp
    ret
