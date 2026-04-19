[org 0x0100]

jmp start

clrscr:
    push es
    push ax
    push di

    mov ax, 0xb800      ; base of video memory
    mov es, ax          ; can't move directly due to intel rules
    mov di, 0           ; di will be use as a index
    
    nextpos:
        mov word[es:di], 0x7020     ; print in the cell di is pointing ( space with white background)
        add di, 2                   ; adding 2 to di coz every cell is 2bytes so to move to next cell we add 2 to di

        cmp di, 4000                ; comparing it with 4000 coz full Extended segment is 4000bytes
        jne nextpos

    pop di
    pop ax
    pop es

start:
    call clrscr

    mov ah, 0x1                     ; it will tell to os wait for user input
    int 0x21                        ; invoke systemcall

    mov ax, 0x4c00
    int 0x21