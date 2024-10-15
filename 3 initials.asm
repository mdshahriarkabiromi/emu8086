.model small
.stack 100h
.data
    a db 'ENTER THREE INITIALS: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, a
    mov ah,09hh
    int 21h

    mov ah,01h
    int 21h
    mov bl,al
    
    mov ah,01h
    int 21h
    mov bh,al
    
    mov ah,01h
    int 21h
    mov cl,al
    
    
    mov ah,02h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,02h
    mov dl, bl
    int 21h
    
    mov ah,02h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,02h
    mov dl, bh
    int 21h
    
    mov ah,02h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,02h
    mov dl, cl
    int 21h
    

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main