[org 0x0100]

jmp start
	data: dw 9,8,7,6,5
	

start:
	mov cx, 5
	outerloop:
	mov bx, 0
		innerloop:
			mov ax, [data + bx]		; First value is moved to ax register
			cmp ax, [data + bx + 2]		; Comparing 1st value with 2nd
			jbe noswap		; Jump if below or equal
		;swapping
		mov dx, [data + bx + 2]		; Second value is moved to dx register
		mov [data + bx], dx
		mov [data + bx + 2], ax
	
	noswap:
	add bx, 2
	cmp bx, 8
	jne innerloop

	;checking outerloop termination
	sub cx, 1
	jnz outerloop
	
	mov ax, 0x4c00
	int 0x21
