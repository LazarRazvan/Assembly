;
; Get the length of a NULL terminated string
;

section .data
	string db "Test string", 0
	fmt_print db "String (%s) length = %d", 10, 0

section .text
	global main
	extern printf

main:
	push ebp
	mov ebp, esp

	xor ecx, ecx
length_loop:
	mov al, BYTE [string + ecx]
	test al, al
	jz print
	inc ecx
	jmp length_loop

print:
	push ecx
	push string
	push fmt_print
	call printf
	add esp, 12

	leave
	ret
