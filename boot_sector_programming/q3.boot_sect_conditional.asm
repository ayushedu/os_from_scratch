	;; simple boot program for conditional programming
	[org 0x7c00]	
	mov bx, 30

	;; if condition
	cmp bx, 4
	jle then_block1		; first if
	jl then_block2		; else if part
	mov al, 'C'		; else block
	jmp the_end

then_block1:	
	mov al, 'A'
then_block2:	
	mov al, 'B'
the_end:
	mov ah, 0x0e
	int 0x10

	jmp $

	times 510-($-$$) db 0
	dw 0xaa55
