; define structure
struc info
	first_name:	resb 16
	last_name:	resb 16
	age:		resb 1
endstruc

section .data
	; initialize structure
	my_struct:
		istruc info
			at first_name, db "Razvan", 0
			at last_name, db "Lazar", 0
			at age, db 28
		iend

	; print format
	fmt_first_name	db "First name: %s", 10, 0
	fmt_last_name	db "Last name: %s", 10, 0
	fmt_age			db "Age: %d", 10, 0

section .text
	global main
	extern printf

main:

; print_first_name:
	lea eax, [my_struct + first_name]

	push eax
	push fmt_first_name
	call printf
	add esp, 8

; print_last_name:
	lea eax, [my_struct + last_name]

	push eax
	push fmt_last_name
	call printf
	add esp, 8

; print_age:
	movzx eax, byte [my_struct + age]

	push eax
	push fmt_age
	call printf
	add esp, 8

	ret
