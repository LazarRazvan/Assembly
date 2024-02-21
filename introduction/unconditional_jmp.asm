
; use .data section
section .data
	;
	; declare format for printf, print_format symbolc as byte with content
	; "eax: %d", followed by '\n' and NULL terminated character
	;
	print_format db "eax: %d", 10, 0

; use .text section
section .text
	global main					; declare main as global symbol
	extern printf				; declare printf as extern symbol (libc)

main:
	;
	; add operation
	;
	mov eax, 15                 ; store value 15 to eax register
	mov ebx, 22                 ; store value 22 to ebx register
	add eax, ebx                ; add eax and ebx and store result in eax

print_eax:
	;
	; unconditional jump to return label
	;
	jmp return

	;
	; print eax value (will never be executed)
	;
	push eax					; push value of eax register to stack
	push print_format			; push print_format to stack
	call printf					; perform printf
	add esp, 8					; cleanup the stack (eax and print_format)

return:
	;
	; return
	;
	ret
