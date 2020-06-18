message macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small

.data
m1 db 0ah,0dh,"Enter a string: $"
m2 db 0ah,0dh,"The length is :$"
str1 db 30,?,30 dup('$')

.code
mov ax,@data
mov ds,ax

message m1
mov ah,0Ah
lea dx,str1
int 21h

message m2
mov cl,00h
lea si,str1
inc si

step2:  inc si
        inc cl
        mov al,[si]
        cmp al,"$"
        jne step2


add cl,30h
mov dl,cl
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
