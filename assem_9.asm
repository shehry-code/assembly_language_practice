[org 0x0100]

jmp start

data: dw 43, 30, 12, 55
swap: db 0

bubblesort:
    dec cx
    shl cx, 1   ; we define word for data so every number contain 2 bytes that's we are shifting lift to multiply it by 2
    
mainloop:
    mov si, 0   ; use as arrey index
    mov byte[swap], 0

    innerloop:
        mov ax, [bx + si]
        cmp ax, [bx + si + 2]
        jbe noswap  ;jump if below or equal

            mov dx, [bx + si + 2]
            mov [bx + si], dx
            mov [bx + si + 2], ax
            mov byte[swap], 1


    noswap:
        add si, 2
        cmp si, cx
        jne innerloop

    cmp byte[swap], 1
    je mainloop
    
    ret     ; return



start: 
    mov bx, data
    mov cx, 4
    call bubblesort
    mov ax, 0x4c00
    int 0x21