Data Segment
  str1 db 'MALAYALAM','$'  
  strlen1 dw $-str1
  strrev db 20 dup(' ')
  str_pal db 'Palindrome String.','$'
  str_not_pal db 'Not a Palindrome String.','$'
Data Ends

Code Segment
  Assume cs:code, ds:data

  Begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov cx, strlen1
    add cx, -2

    lea si, str1
    lea di, strrev

    add si, strlen1
    add si, -2
    L1:
       mov al, [si]
       mov [di], al
       dec si
       inc di
       loop L1
       mov al, [si]
       mov [di], al
       inc di
       mov dl, '$'
       mov [di], dl
       mov cx, strlen1

    Pal_Check:
       lea si, str1
       lea di, strrev
       repe cmpsb
       jne Not_Pal

    Pal:
       mov ah, 09h
       lea dx, str_pal
       int 21h
       jmp Exit

    Not_Pal:
       mov ah, 09h
       lea dx, str_not_pal
       int 21h

    Exit:
       mov ax, 4c00h
       int 21h
Code Ends
End Begin