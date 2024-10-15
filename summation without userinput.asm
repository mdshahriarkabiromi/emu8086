.model small
.stack 100h
.data

num1 db 5
num2 db 3

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num1
    sub al, num2

    add al, 30h  ; Convert the result to ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
