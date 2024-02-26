;
; Count positive and negative numbers in an array
;

section .data
	print_msg db "Postive numbers count: %d; Negative numbers count: %d", 10, 0

	ARRAY_SIZE EQU 10
	arr_dword dd -123456, -123456, 22222, 33333, -22222, -33333, -1, 2, 2147483647, -2147483648

section .text
	global main
	extern printf

main:
	xor eax, eax						; store positive numbers
	xor ebx, ebx						; store negative numbers
	mov ecx, ARRAY_SIZE					; array counter

pos_neg_loop:
	cmp dword [arr_dword + ecx * 4 - 4], 0
	jl negative

;positive:
	inc eax
	jmp next

negative:
	inc ebx
	jmp next

next:
	loop pos_neg_loop

;print:
	push ebx
	push eax
	push print_msg
	call printf
	add esp, 12

	ret
