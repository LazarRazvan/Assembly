;
; Compute the sum of first N square natural numbers.
;
; Use "loop" instruction that use ecx as counter
;

section .data
	num dd 100							; number
	sum db "Sum square: %ld", 10, 0		; print format

section .text
	global main
	extern printf

main:
	xor eax, eax						; use eax to store the sum
	mov ecx, dword[num]					; counter

sum_loop:
	; preserve sum (eax)
	push eax

	; compute number square
	mov eax, ecx
	mul ecx

	; store multiplication result to edx (ignore high part)
	mov edx, eax

	; retrieve sum from stack and add current square number
	pop eax
	add eax, edx

	loop sum_loop

	; print sum
	push eax
	push sum
	call printf
	add esp, 8

	ret
