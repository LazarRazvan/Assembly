;
; Convert string letters to upper case inplace (use same string)
;
; void string_toupper(char *base_str)
;

section .data
	base_str db "TeSt StRinG", 0
	fmt_print db "String = %s", 10, 0

section .text
	global main
	extern printf

string_toupper:
	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]		; base_str
	xor ecx, ecx			; counter

toupper_loop:
	mov al, BYTE[esi + ecx]
	test al, al
	jz toupper_end
	cmp al, 0x61			; only consider samller letters
	jl toupper_loop_inc
	sub al, 0x20			; convert to upper letter
	mov BYTE[esi + ecx], al
toupper_loop_inc:
	inc ecx					; increment counter
	jmp toupper_loop

toupper_end:
	leave
	ret

main:
	push ebp
	mov ebp, esp

;convert_to_upper:
	push base_str
	call string_toupper
	add esp, 4

;print:
	push base_str
	push fmt_print
	call printf
	add esp, 8

	leave
	ret
