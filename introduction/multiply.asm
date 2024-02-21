;
; Multiplication of two numbers
; 1) two byte numbers
;    - multiplier has to be placed in "al" register
;    - multiplicand has to be specified to "mul" as value or register
;    - multiplier and multiplicand has to be of same size
;    - result is store in eax
;
; 2) two word numbers
;    - multiplier has to be placed in "ax" register
;    - multiplicand has to be specified to "mul" as value or register
;    - multiplier and multiplicand has to be of same size
;    - result is store in "DX:AX"
;
; 3) two double  word numbers
;    - multiplier has to be placed in "eax" register
;    - multiplicand has to be specified to "mul" as value or register
;    - multiplier and multiplicand has to be of same size
;    - result is store in "EDX:EAX"
;

section .data
	; print format
	result db "Multiplication result: %ld", 10, 0
	resultd db "Multiplication result: hi(%ld); lo(%ld)", 10, 0

	; byte numbers
	num1_byte db 100
	num2_byte db 25

	; word numbers
	num1_word dw 3200
	num2_word dw 1500

	; double word numbers
	num1_dword dd 75000
	num2_dword dd 120000

section .text
	global main
	extern printf

main:

; byte_multiplication
	xor eax, eax
	xor ebx, ebx

	mov al, byte [num1_byte]
	mov bl, byte [num2_byte]
	mul bl

	push eax
	push result
	call printf
	add esp, 8

; word_multiplication
	xor eax, eax
	xor ebx, ebx

	mov ax, word [num1_word]
	mov bx, word [num2_word]
	mul bx

	; create result into a single register
	mov bx, dx
	shl ebx, 16
	mov bx, ax

	push ebx
	push result
	call printf
	add esp, 8

; double word_multiplication
	xor eax, eax
	xor ebx, ebx

	mov eax, dword [num1_dword]
	mov ebx, dword [num2_dword]
	mul ebx

	push eax
	push edx
	push resultd
	call printf
	add esp, 12
	
	ret
