[org 0x0100]

jmp start

data: dw 9,8,7,6,5

start:
mov cx,4

outerloop:
mov bx,0

innerloop:
mov ax,[data+bx]
cmp ax,[data+bx+2]
jbe noswap

mov dx,[data+bx+2]
mov [data+bx],dx
mov [data+bx+2],ax

noswap:
add bx,2
cmp bx,6
jle innerloop

sub cx,1
jnz outerloop

mov ax,0x4c00
int 0x21
