;Name: Uzair Akram

INCLUDE Irvine32.inc


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
;Student ID 3322444
	array DWORD 3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4
	lower DWORD 3
	upper DWORD 8
	ArrayLength = LENGTHOF array
	inclusion DWORD 0
	index WORD 0
	sum DWORD 0
;prompts
	promptForSum BYTE "SUM = ",0
	PromptForIncluded BYTE 13,10,"INCLUDED = ",0

.code

main PROC
;Addition
	mov edi, OFFSET array
mov ecx, LENGTHOF array
.WHILE ecx > 0
		mov eax, [edi]
	.IF (eax <= upper) && (lower <= eax)
		mov eax, sum
		add eax, [edi]
		mov sum, eax
		inc inclusion
	.ENDIF
	add edi, TYPE array
	dec ecx
.ENDW

;Sum ouput
	mov edx, OFFSET promptForSum
	call WriteString
	mov eax, sum
	call WriteInt
;Inclusion output
	mov edx, OFFSET promptForIncluded
	call WriteString
	mov eax, inclusion
	call WriteInt

	mov eax, sum
	mov ebx, ArrayLength
	mov ecx, inclusion

;Routine
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main