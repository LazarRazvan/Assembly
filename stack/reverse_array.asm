;
; Reverse elements of an array using stack
;

section .data
	ARRAY_SIZE EQU 10

	arr_in  dd 101, 102, 103, 104, 105, 106, 107, 108, 109, 110
	arr_out times ARRAY_SIZE dd 0

	fmt_print db "arr[%d] = %d", 10, 0

section .text
	global main
	extern printf

main:
	; push elements of input array to the stack
	xor ecx, ecx

array_stack_push:
	mov eax, dword[arr_in + ecx * 4]
	push eax

	inc ecx
	cmp ecx, ARRAY_SIZE
	jne array_stack_push

	xor ecx, ecx
array_stack_pop:
	pop eax
	mov dword[arr_out + ecx * 4], eax

	inc ecx
	cmp ecx, ARRAY_SIZE
	jne array_stack_pop

	xor ecx, ecx
array_print:
	mov eax, dword[arr_out + ecx * 4]

	push eax
	push ecx

	push eax
	push ecx
	push fmt_print
	call printf
	add esp, 12

	pop ecx
	pop eax

	inc ecx
	cmp ecx, ARRAY_SIZE
	jne array_print

	ret
