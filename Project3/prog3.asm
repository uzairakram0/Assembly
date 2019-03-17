;Name: Uzair Akram

INCLUDE Irvine32.inc


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	Albatross DWORD 5 DUP(0)
	rowsize = ($ - Albatross)
				DWORD 5 DUP(0)
				DWORD 5 DUP(0)
				DWORD 5 DUP(0)

	employee DWORD ?
	product DWORD ?
	Sales SDWORD ?

	itterator DWORD ?
	
	comma BYTE ", ",0
	Invalid BYTE "Invalid",13,10,0
	newline BYTE 13,10,0

	init BYTE "Enter employee number followed by sale and then product number",13,10,0
	prompt BYTE "Enter:",13,10,0
	head BYTE "Albatross~ PD1, PD2, PD3, PD4, PD5",13,10,0
	row BYTE "Employee#",0
	colon BYTE ": ",0

.code

main PROC
	
	mov edx, OFFSET init
	call WriteString

.WHILE 1
	mov edx, OFFSET prompt
	call WriteString

	call ReadInt						;Enter employee number
	.IF eax < 1
		mov edx,OFFSET Invalid
		call WriteString
		.CONTINUE
	.ELSEIF eax > 4
		mov edx,OFFSET Invalid
		call WriteString
		.CONTINUE
	.ELSE
		dec eax
		mov employee, eax
	.ENDIF

	call ReadInt					;Enter sales
	cmp eax, 0
	jl isNegative
	
		mov Sales, eax

	call ReadInt					;Enter product nubmer
	.IF eax < 1
		mov edx,OFFSET Invalid
		call WriteString
		.CONTINUE
	.ELSEIF eax > 5
		mov edx,OFFSET Invalid
		call WriteString
		.CONTINUE
	.ELSE
		dec eax
		mov product, eax
	.ENDIF
	
;ROW OFFSET
	mov eax, employee
	mov ecx, rowsize
	mul ecx
	mov ebx, OFFSET Albatross
	add ebx, eax

;Column OFFSET
	mov eax, product
	mov esi, TYPE Albatross
	mul esi

;Element pointer
	mov edi, ebx
	add edi, eax

;Enter value at element
	mov eax, Sales
	mov [edi], eax

.ENDW

isNegative:

;Display 2d Array
	mov esi, OFFSET Albatross
	mov itterator, 0

;Print Header
	mov edx,OFFSET head
	call WriteString

.WHILE itterator < 4
	mov ecx, LENGTHOF Albatross
	push esi
;Print ROW label
	mov edx,OFFSET row
	call WriteString
	mov eax, itterator
	inc eax
	call WriteInt
	mov edx, OFFSET colon
	call WriteString

;Inner loop print row
	L1: lodsd
		call WriteInt
		
		;insert comma beetween elements
		mov edx, OFFSET comma
		call WriteString
		LOOP L1
	
	;start newline after each row
	mov edx, OFFSET newline
	call WriteString
	
	;update
	inc itterator
	pop esi
	add esi, rowsize
.ENDW
	
	INVOKE ExitProcess, 0
main ENDP
END main