[org 0x0100]

jmp start

	dest: dw 0x40FF
	src: dw 0x1001
start:
	xor ax, ax
	mov al, [src]
	add byte[dest], al

	mov al, [src+1]
	adc byte[dest+1], al

	mov ax, 0x4c00
	int 0x21
