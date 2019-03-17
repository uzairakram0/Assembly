;Name: Uzair Akram

INCLUDE Irvine32.inc


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	Donation DWORD ?
	init BYTE "Enter a dolar amount Between $1 and $5,000, or amount outside range to quit",13,10,"Enter Donation $",0
	Platinum BYTE "Platinum",13,10,0
	PUpper DWORD 5000
	PLower DWORD 4000
	Gold BYTE "Gold",13,10,0
	GUpper DWORD 3999
	GLOWER DWORD 3000
	Silver BYTE "Silver",13,10,0
	SUpper DWORD 2999
	SLower DWORD 2000
	Bronze BYTE "Bronze",13,10,0
	BUpper DWORD 1999
	BLower DWORD 1000
	Copper BYTE "Copper",13,10,0
	CUpper DWORD 999
	CLower DWORD 1
	quit BYTE 13,10,"quitting...",0
	Miser BYTE 13,10,"That's not vey charitable",0

	Array WORD 1,2,4,8,16,32,64
	ArrayLength=($ - Array)/2

.code

main PROC
.WHILE 1
	mov edx, OFFSET init
	call WriteString
	call ReadInt
	mov Donation, eax

	.IF Donation > 5000
		mov edx,OFFSET quit
		call WriteString
		.BREAK
	.ELSEIF (eax <= PUpper) && (PLower <= eax)
		mov edx,OFFSET Platinum
		call WriteString
	.ELSEIF (eax <= GUpper) && (GLOWER <= eax)
		mov edx,OFFSET Gold
		call WriteString
	.ELSEIF (eax <= SUpper) && (SLower <= eax)
		mov edx,OFFSET Silver
		call WriteString
	.ELSEIF (eax <= BUpper) && (BLower <= eax)
		mov edx,OFFSET Bronze
		call WriteString
	.ELSEIF (eax <= CUpper) && (CLower <= eax)
		mov edx,OFFSET Copper
		call WriteString
	.ELSEIF Donation == 0
		mov edx,OFFSET Miser
		call WriteString
		.BREAK
	.ELSE
		mov edx,OFFSET quit
		call WriteString
		.BREAK
	.ENDIF
.ENDW

	INVOKE ExitProcess, 0
main ENDP
END main