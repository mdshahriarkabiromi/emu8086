.model small
.stack 100h
.data
msg1 db 'Enter the 1st Number: $'
msg2 db 'Enter the 2nd Number: $'
msg3 db 'Difference is: $'

num1 db ?
num2 db ?
diff db ?
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
    
    mov dl,num1  ; Move the first number to dl
    sub dl,num2  ; Subtract the second number from dl
    mov diff,dl   ; Store the result in diff
    add diff,30h  ; Convert the result to ASCII

    mov ah,09h
    lea dx,msg3
    int 21h
    
    mov ah,02h
    mov dl,diff
    int 21h
    
    mov ah,4ch
    int 21h
    
main endp
end main