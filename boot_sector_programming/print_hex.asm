	;; simple boot program to print hex value
	mov dx, 0x1fb6
	call print_hex
	jmp $

	%include "print_string.asm"
	
print_hex:
	pusha
	mov cx, 4		; start the counter; 4 bits per character

char_loop:
	dec cx			; decrement
	mov ax, dx		
	shr dx, 4		; shift 4 bits to right
	and ax, 0xf		; mask to get last 4 bits

	mov bx, HEX_OUT 	
	add bx, 2
	add bx, cx

	cmp ax, 0xa
	jl set_letter
	add byte [bx], 6
	jl set_letter

set_letter:
	add byte [bx], al
	cmp cx, 0
	je print_hex_done
	jmp char_loop

print_hex_done:
	mov bx, HEX_OUT
	call print_string

	popa
	ret

HEX_OUT:
	db '0x0000', 0

	times 510-($-$$) db 0
	dw 0xaa55
