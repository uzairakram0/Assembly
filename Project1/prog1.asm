;Name: Uzair Akram

INCLUDE Irvine32.inc


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
;Student ID 3322444
	left DWORD 332
	right DWORD 2444
	total DWORD 0
	diff DWORD 0
	message BYTE "Hello World!",0
	Array WORD 1,2,4,8,16,32,64
	ArrayLength=($ - Array)/2

.code

main PROC
;Addition
	mov eax, left
	add eax, right
	mov total, eax
;Subtraction
	mov eax, right
	sub eax, left
	mov diff, eax
;Content to Registers
	mov eax, left
	mov ebx, right
	mov ecx, total
	mov edx, diff
	mov esi, ArrayLength

;Routine
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main