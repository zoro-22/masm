.MODEL SMALL
.STACK 100H

.DATA
    dividend DB 52H    ; Dividend (numerator)
    divisor  DB 0AH    ; Divisor (denominator)
    quotient DB ?       ; Quotient
    remainder DB ?      ; Remainder
    remMsg DB 'Rem:', '$'     ; Message for remainder
    quoMsg DB 'Quo:', '$'     ; Message for quotient

.CODE
MAIN PROC
    MOV AX, @DATA       ; Initialize data segment
    MOV DS, AX

    MOV AL, dividend    ; Move dividend to AL register
    MOV BL, divisor     ; Move divisor to BL register

    XOR AH, AH          ; Clear AH register

    DIV BL              ; Divide AL by BL (quotient in AL, remainder in AH)

    MOV quotient, AL    ; Store quotient in memory
    MOV remainder, AH   ; Store remainder in memory

    ; Display the remainder
    MOV AH, 09H         ; Function to display a string
    LEA DX, remMsg      ; Load the address of the remainder message
    INT 21H             ; Display remainder message
    MOV DL, remainder   ; Load remainder value
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02H         ; Function to display a single character
    INT 21H             ; Display remainder

    ; Display the quotient
    MOV AH, 09H         ; Function to display a string
    LEA DX, quoMsg      ; Load the address of the quotient message
    INT 21H             ; Display quotient message
    MOV DL, quotient    ; Load quotient value
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02H         ; Function to display a single character
    INT 21H             ; Display quotient

    MOV AH, 4CH         ; Function to terminate the program
    INT 21H

MAIN ENDP
END MAIN
