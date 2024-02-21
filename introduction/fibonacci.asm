;
; Find n-th element of fibonnaci sequence when n is stored in eax register
;

section .data
	nfib db "%d element of fibonnaci sequence is: %d", 10, 0

section .text
	global main
	extern printf

main:
	mov eax, 3					; find the 15-th element of sequence
	push eax					; preserve initial value

	mov ebx, 0					; first number in fib sequence
	mov ecx, 1					; second number in fib sequence

fib_loop:

	add ebx, ecx				; compute next element
	xchg ebx, ecx				; set values for next loop

	sub eax, 1
	test eax, eax
	jne fib_loop

	pop eax						; restore initial value of eax

	push ebx					; print message
	push eax
	push nfib
	call printf
	add esp, 12					; restore stack

	ret
