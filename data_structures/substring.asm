;
; Find occurences of a substring in a string
;

section .data
	src_string db "abcdabcccaaabcabbcabcc", 0
	sub_string db "abc", 0

	fmt_occurences db "Substring occurences: %d", 10, 0

section .text
	global main
	extern printf

main:
	xor ecx, ecx				; store occurences of substring in string
	mov esi, src_string

src_loop:

; find_substring:
	mov edi, sub_string

	mov eax, esi
	mov ebx, edi

sub_loop:
	cmp byte[ebx], 0
	je sub_found				; substring found

	cmp byte[eax], 0
	je src_continue				; reach to end of source string

	mov dl, byte[ebx]
	cmp byte[eax], dl			; different characters
	jne src_continue

	inc eax
	inc ebx
	jmp sub_loop

sub_found:
	inc ecx

src_continue:
	inc esi
	cmp byte [esi], 0
	jne src_loop

	; print
	push ecx
	push fmt_occurences
	call printf
	add esp, 8

	ret

