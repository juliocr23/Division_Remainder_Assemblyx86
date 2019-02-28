INCLUDE Irvine32.inc

.data
dividend byte 0
divisor byte 0
prompt1 byte "Enter the divident: ",0
prompt2 byte "Enter the divisor: ",0
division byte 0
remainder byte 0

.code
main PROC

	;Prompt user for the dividend
	MOV EDX,offset prompt1
	call writestring
	
	;Read dividend
	call readDec
	MOV dividend,AL

	;Prompt user for the divisor
	MOV EDX,offset prompt2
	call writestring

	;Read divisor.
	call readDec
	MOV divisor,Al

	MOV EAX,0		;Clear register
	call divide

	MOV EAX,0      ;Clear Register
	MOV AL,division
	call writedec
	
	MOV AL,"R"
	call writechar

	MOV AL,remainder
	call writedec

	call crlf

exit
main ENDP

divide PROC
 
 MOV EAX,0
 MOV AL,divisor

 ;Find the division and remainder of division.
.while(dividend>= AL)
	SUB dividend, AL
	add AH,1
.endw

	MOV AL,dividend
	MOV remainder,AL
	MOV division,AH
ret
divide ENDP
end main