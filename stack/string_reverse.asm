;
; Reverse a string into another string using a function like
;
; void reverse_string(char *base_str, size_t base_size, char *rev_str)
;

section .data
	rev_str times 64 db 0
	base_str db "Test string", 0
	fmt_print db "Base string (%s); reverse string(%s)", 10, 0

section .text
	global main
	extern printf

string_reverse:
	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]		; base_str
	mov edx, [ebp + 12]		; base_size
	mov edi, [ebp + 16]		; rev_str

	mov ecx, edx			; base string counter (starts from end)
	xor eax, eax			; rev string counter (starts from beginning)

reverse_loop:
	mov bl, BYTE [esi + ecx - 1]
	mov BYTE [edi + eax], bl
	inc eax
	loop reverse_loop

	leave
	ret

main:
	push ebp
	mov ebp, esp

	xor ecx, ecx
length_loop:
	mov al, BYTE [base_str + ecx]
	test al, al
	jz finish
	inc ecx
	jmp length_loop

finish:
	push rev_str
	push ecx
	push base_str
	call string_reverse
	add esp, 12

;print
	push rev_str
	push base_str
	push fmt_print
	call printf
	add esp, 12

	leave
	ret
