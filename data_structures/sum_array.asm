;
; Compute the sum of array elements
;

section .data
	ARRAY_SIZE EQU 10					; arrays size

	;
	; arrays
	;
	arr_byte  db 1,2,3,4,5,6,7,8,9,10
	arr_word  dw 301,302,303,304,305,306,307,308,309,310
	arr_dword dd 70001,70002,70003,70004,70005,70006,70007,70008,70009,700010

	print_sum db "Array sum: %ld", 10, 0

section .text
	global main
	extern printf

main:
	xor eax, eax						; use eax register for sum
	mov ecx, ARRAY_SIZE

byte_array_sum:
	add al, byte [arr_byte + ecx - 1]
	loop byte_array_sum

	push eax
	push print_sum
	call printf
	add esp, 8

	xor eax, eax						; use eax register for sum
	mov ecx, ARRAY_SIZE

word_array_sum:
	add ax, word [arr_word + ecx * 2 - 2]
	loop word_array_sum

	push eax
	push print_sum
	call printf
	add esp, 8

	xor eax, eax						; use eax register for sum
	mov ecx, ARRAY_SIZE

dword_array_sum:
	add eax, dword [arr_dword + ecx * 4 - 4]
	loop dword_array_sum

	push eax
	push print_sum
	call printf
	add esp, 8

	ret
