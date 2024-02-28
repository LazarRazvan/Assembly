;
; Manipulate stack using add/sub and inspect it
;

section .data
	NUM EQU 10

	stack_fmt db "%p: %d", 10, 0

section .text
	global main
	extern printf

main:
	mov ebp, esp
	mov ecx, NUM		; add first NUM numbers to stack

add_num_to_stack:
	push ecx
	loop add_num_to_stack

;dump_stack:
	mov eax, ebp
	dec eax

dump_stack_loop:

	movzx ebx, byte [eax]
	push eax

	push ebx
	push eax
	push stack_fmt
	call printf
	add esp, 12

	pop eax
	dec eax
	cmp eax, esp
	jge dump_stack_loop

	; restore stack to previous value
	mov esp, ebp

	ret
