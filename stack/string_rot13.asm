;
; Perform rot13 algorithm on an input string
;
; void string_rot13(char *base_str)
;

section .data
	base_str db "TeStStRinG", 0
	fmt_print db "String rot13 = %s", 10, 0

section .text
	global main
	extern printf

string_rot13:
	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]		; base_str
	xor ecx, ecx			; counter

rot13_loop:
	xor eax, eax
	xor ebx, ebx

	mov al, BYTE[esi + ecx]
	test al, al
	jz rot13_end
;rot13:
	cmp al, 0x61
	jl rot13_upper_letter

;rot13_lower_letter:
	sub al, 0x61			; offset to 0 index
	add al, 13
	mov bl, 26
	div bl
	add ah, 0x61
	jmp rot13_loop_inc

rot13_upper_letter:
	sub al, 0x41
	add al, 13
	mov bl, 26
	div bl
	add ah, 0x41

rot13_loop_inc:
	mov BYTE[esi + ecx], ah
	inc ecx					; increment counter
	jmp rot13_loop

rot13_end:
	leave
	ret

main:
	push ebp
	mov ebp, esp

;convert_to_upper:
	push base_str
	call string_rot13
	add esp, 4

;print:
	push base_str
	push fmt_print
	call printf
	add esp, 8

	leave
	ret
