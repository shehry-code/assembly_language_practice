[org 0x0100]

mov ax, 0xb800  ; 0xb800 is the base of the Extended register which is video memory
mov es, ax      ; we can't move 0xb800 to es it's rules by intel
mov di, 0       ; di will be use as index to traversing on all the cell in Extended segment

nextloc:
    mov word[es:di], 0x7020     ; now we're printing space with blackground in first cell of Extended segment
    add di, 2

    cmp di, 4000
    jne nextloc

mov ah, 0x1     ; Here we are invoking system call to solve the issue of interrupting by the operating system
int 0x21

mov ax, 0x4c00
int 0x21