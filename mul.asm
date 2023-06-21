cr equ 0dh
lf equ 0ah
data segment
table db '0123456789abcdef'
n1 db 005h
n2 db 006h
res dw 00000h
msg db 'the result is '
as_res db 4 dup(?)
db cr,lf,'$'
data ends
code segment
assume cs:code, ds:data
start: mov ax,data
mov ds,ax
mov al, n1
mov bh, n2
mul bh
mov res,ax
lea bx,table
lea si, as_res
add si,3
mov ax,res
and ax,0000fh
xlat
mov [si],al
dec si
mov ax,res
and ax,000f0h
mov cl,04h
shr ax,cl
xlat
mov [si],al
dec si
mov ax,res
and ax,00f00h
mov cl,08h
shr ax,cl
xlat
mov [si],al
dec si
mov ax,res
and ax,0f000h
mov cl,0ch
shr ax,cl
xlat
mov [si],al
mov ah,09h
lea dx,msg
int 21h
mov ah,04ch
int 21h
code ends
end start