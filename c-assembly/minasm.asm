
section .text
	global asm_min

asm_min:
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]				; array address
	mov ecx, [ebp+12]				; array size

	mov edx, 2147483647				; set maximum limit in init

min_loop:
	mov ebx, DWORD[eax + ecx * 4 - 4]
	cmp ebx, edx
	jge min_loop
	mov edx, ebx
inc:
	loop min_loop

	leave
	ret
