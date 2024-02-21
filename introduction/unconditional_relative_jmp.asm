
; use .data section
section .data
	;
	; declare format for printf, print_format symbolc as byte with content
	; "eax: %d", followed by '\n' and NULL terminated character
	;
	print1 db "First print", 10, 0
	print2 db "Second print", 10, 0

; use .text section
section .text
	global main					; declare main as global symbol
	extern printf				; declare printf as extern symbol (libc)

main:
	;
	; perform second message
	;
	jmp second

first:
	;
	; print first message
	;
	push print1					; push print_format to stack
	call printf					; perform printf
	add esp, 4					; cleanup the stack (eax and print_format)

	jmp return					; finish message

second:
	;
	; print second message
	;
	push print2					; push print_format to stack
	call printf					; perform printf
	add esp, 4					; cleanup the stack (eax and print_format)

	jmp $-0x1c					; relative jump to first

return:
	;
	; return
	;
	ret
