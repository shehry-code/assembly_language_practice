[org 0x0100]

jmp start

data: dw 60,54, 3, 23
swap: db 0

bubblesort:
    dec cx
    shl cx, 1       ; shl will multiply it by two 

mainloop: 
    mov si, 0       ; use as arrey index
    mov byte[swap], 0   ; swap flag

        innerloop:
        mov ax, [bx+si]
        cmp ax, [bx+si+2]
        jbe noswap      ; jump if below or equal

            ; swapping
            mov dx, [bx+si+2]
            mov [bx+si], dx
            mov [bx+si+2], ax
            mov byte[swap], 1