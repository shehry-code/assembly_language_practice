;assembly hello! in 32 bit system
SECTION .text:	; text means it's the code section

GLOBAL _start	; we mark it as global so now it will be visible to the whole program

_start:	; it's the Entry point
	mov eax, 0x4	; system call for write
	mov ebx, 1	; output on console
	mov ecx, message	; The string which we want to write on console
	mov edx, message_length		; Length of the string
	int 0x80	; Invoke system call

	; Exiting program
 	mov eax, 0x1	; Exit system call
	mov ebx, 0	; return zero (optional)
	int 0x80	; Invoke system call

SECTION .data:	
	message: db "hello!", 0xA, 0x0
	message_length: equ $-message	; $-> means current address so Current address - message gives as the string lenght
	
