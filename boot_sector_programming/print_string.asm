print_string:
	pusha
	mov ah, 0x0e		; teletype BIOS routine

loop:	
	mov al, [bx] 		; bx is parameter to the function call containing address string
	cmp al, 0		; if char is 0, return
	je return
	int 0x10		; else print
	inc bx			; increment bx
	jmp loop

return:
	popa
	ret

