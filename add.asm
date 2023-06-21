.MODEL SMALL
.STACK 100H

.DATA
    num1 DB 05h   ; First hexadecimal number
    num2 DB 02h   ; Second hexadecimal number
    result DB ?   ; Variable to store the result
    message DB 'The result is: $'  ; Message to display before the result

.CODE
    MAIN PROC
        MOV AX, @DATA  ; Initialize DS register
        MOV DS, AX

        ; Add the numbers 
        MOV AL, num1   ; Move the first number to AL register
        ADD AL, num2   ; Add the second number to AL register
        MOV result, AL ; Store the result in the result variable

        ; Display the message
        MOV AH, 09H    ; Function to display a string
        MOV DX, OFFSET message ; Load the offset of the message
        INT 21H        ; Call the DOS interrupt to display the message

        ; Display the result
        MOV AH, 02H    ; Function to display a character
        MOV DL, result ; Move the result to DL register
        ADD DL, 30H    ; Convert the result to ASCII character
        INT 21H        ; Call the DOS interrupt to display the result

        MOV AH, 4CH    ; Function to terminate the program
        INT 21H        ; Call the DOS interrupt

    MAIN ENDP
END MAIN
