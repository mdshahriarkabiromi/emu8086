.model small
.stack 100h
.code
main proc

    mov ah, 1        ; Set function to read a character from keyboard
    int 21h          ; Interrupt to read the character
    mov bl, al       ; Move the read character to BL register

    sub bl, 17       ; Convert hex digit 'A'-'F' to decimal (10-15)
    mov ah, 2        ; Set function to display a character

    mov ah, 2        ; Set function to display a character
    mov dl, 49       ; Move ASCII code for '1' to DL (49 is ASCII for '1')
    int 21h          ; Interrupt to display the character

    mov ah, 2        ; Set function to display a character
    mov dl, bl       ; Move the decimal value to DL register
    int 21h          ; Interrupt to display the character

main endp
end main