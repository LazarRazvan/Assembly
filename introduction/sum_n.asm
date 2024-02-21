;
; Compute the sum of first N natural numbers.
;
; Use "loop" instruction that use ecx as counter
;

section .data
	num dd 100						; number
	sum db "Sum: %ld", 10, 0		; print format

section .text
	global main
	extern printf

main:
	xor eax, eax					; use eax to store the sum
	mov ecx, dword[num]				; counter

sum_loop:
	add eax, ecx
	loop sum_loop

	; print sum
	push eax
	push sum
	call printf
	add esp, 8

	ret
