;
; Number decomposition into powers of 2
;

section .data
	pow db "2pow: %d", 10, 0

section .text
	global main
	extern printf

main:
	mov eax, 225				; TODO: number to be decomposed
	mov ebx, 1					; power of 2

loop:
	;
	; check all bits from 0 to 31
	;
	cmp eax, ebx
	jl finish

	;
	; check if n-th bit is set
	;
	test eax, ebx
	jz increment

	;
	; current bit is set, print it (preserve registers values)
	;
	push eax
	push ebx

	push ebx
	push pow
	call printf
	add esp, 8

	;
	; restore registers
	;
	pop ebx
	pop eax

increment:
	;
	; set n-th bit (2^n) into edx
	;
	shl ebx, 1

	jmp loop

finish:
	ret
