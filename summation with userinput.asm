.model small
.stack 100h
.data
msg1 db 'Enter the 1st Number: $'
msg2 db 'Enter the 2nd Number: $'
msg3 db 'Sum is: $'

num1 db ?
num2 db ?
sum db ?
.code
main proc
    
    mov ax,@data
    mov ds,ax
  
    mov ah,09h
    lea dx,msg1
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov num1,al
    
    mov ah,09h
    lea dx,msg2
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov num2,al
    
    mov dl,num1
    add dl,num2
    mov sum,dl
    add sum,30h
    
    mov ah,09h
    lea dx,msg3
    int 21h
    
    mov ah,02h
    mov dl,sum
    int 21h
    
    mov ah,4ch
    int 21h
    
main endp
end main
    