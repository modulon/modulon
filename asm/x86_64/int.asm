;;------------------------------------------------------------------------------------------------
;;`arch/x86_64/interrupt_handlers.asm`
;;
;;Assembly wrappers for IDT functions.
;;------------------------------------------------------------------------------------------------

global asm_lidt

global asm_sys
global asm_kb

extern sys
extern kb

section .text
bits 64

asm_lidt:
	mov [idtr + 2], rdi
	lidt [idtr]
	sti
	ret

idtr:
	dw 4095
	dq 0

asm_sys:
	mov qword [temp], sys
	jmp isr_stub

asm_kb:
	mov qword [temp], kb
	jmp isr_stub

isr_stub:
	push rax
	push rcx
	push rdx
	push rbx
	push rsp
	push rbp
	push rsi
	push rdi

	mov rax, rsp
	push rax

	call [temp]

	pop rax

	pop rdi
	pop rsi
	pop rbp
	pop rsp
	pop rbx
	pop rdx
	pop rcx
	pop rax

	iretq

temp:
	dq 0
