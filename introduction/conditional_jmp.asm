
; use .data section
section .data
	;
	; declare format for printf, print_format symbolc as byte with content
	; "eax: %d", followed by '\n' and NULL terminated character
	;
	equal db "Values are equal", 10, 0
	not_equal db "Values are not equal", 10, 0

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
compare1:
	cmp eax, ebx                ; compare eax and ebx registers
	jne neq						; jump to not equal if they are not equal

compare2:
	mov eax, 15                 ; store value 15 to eax register
	mov ebx, 15                 ; store value 15 to ebx register
	cmp eax, ebx                ; compare eax and ebx registers
	je eq						; jump to equal if they are equal

	ret

neq:
	;
	; print not equal message
	;
	push not_equal				; push not_equal to stack
	call printf					; perform printf
	add esp, 4					; cleanup the stack (eax and print_format)

	jmp compare2				; move back to compare again

eq:
	;
	; print not equal message
	;
	push equal					; push equal to stack
	call printf					; perform printf
	add esp, 4					; cleanup the stack (eax and print_format)

return:
	;
	; return
	;
	ret
