[org 0x0100]

mov ax, 5   ; move 5 to the accumulator register
mov bx, 10  ;move 10 to the base register
add ax, bx  ;adding the values in register ax and bx and storing it in ax
mov bx, 12
add ax, bx

mov ax, 0x4c00  ; exiting
int 0x21
