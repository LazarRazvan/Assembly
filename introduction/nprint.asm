;
; Print custom message N times (specified in ecx register) if value of register
; eax is greater than value of register ebx
;

; use .data section
section .data
	msg db "Print", 10, 0

; use .text section
section .text
	global main
	extern printf

main:
	mov ecx, 10					; counter value
	mov eax, 25
	mov ebx, 20
	cmp eax, ebx
	jge nprint

	ret

nprint:
	cmp ecx, 0
	jl return

	push ecx					; prevent ecx to be altered by printf
	call print_message
	pop ecx						; restore ecx value
	sub ecx, 1
	jmp nprint

print_message:
	push msg
	call printf
	add esp, 4

return:
	ret
