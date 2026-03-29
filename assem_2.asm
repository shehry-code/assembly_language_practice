[org 0x0100]
	;This program is just adding all the number which is label as (num1) and store the result in lable result
	jmp start
	num1: dw 10, 20, 30, 40, 50, 10, 20, 30, 40, 50
	result: dw 0

	start:
	;initializing stuff
	xor ax, ax	; It will remove the garbedge values from the ax register and replace it with zero
	mov bx, ax	
	
	outerloop:
		add ax, [num1 + bx]
		add bx, 2

		cmp bx, 20
		jne outerloop
	mov [result], ax
	
	mov ax, 0x4c00
	int 0x21
