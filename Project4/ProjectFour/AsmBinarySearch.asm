TITLE AsmBinarySearch Procedure (AsmBinarySearch.asm)

	.586
	.model flat,C

	AsmBinarySearch PROTO, searchValue:DWORD, arrayPTR:PTR DWORD, count:DWORD

	.data

	.code
	;----------------------------------------------------------
	AsmBinarySearch PROC USES edi, searchValue:DWORD, arrayPTR:PTR DWORD, count:DWORD
	;
	; Performs a binary search for a 32 - bit integer
	; in an array of integers. Returns the value of the subscript
	; of the matching array element in EAX, or -1 in EAX if the
	; search value was not found in the array.
	; ----------------------------------------------------------

	mov esi, arrayPTR
	mov edi, searchValue
	mov ebx, 0		;first = 0
	mov ecx, count	;last = count - 1
	dec ecx

.WHILE ebx <= ecx	; while first <= last
	
	mov eax, ebx	;middle = (first + last)/2
	add eax, ecx
	shr eax, 1
	
	push eax

	;middle pointer = ArrayOFFSET + middle * dataType
	mov edx, TYPE searchValue
	mul edx
	mov edx, esi
	add edx, eax

	pop eax

	cmp [edx], edi	;If array[middle] = searchValue
	je omega
	cmp [edx], edi	;If array[middle] < searchValue
	jl less
	cmp [edx], edi	;if array[middle] > searchValue
	jg greater

greater: mov ecx, eax	; last = middle - 1
	dec ecx
.CONTINUE

less: mov ebx, eax		; first = middle + 1
	inc ebx
	

.ENDW	

	mov	eax,-1		; Set the return value to indicate that
	jmp	short omega	; the search value was not found.



omega:
	ret			; return
AsmBinarySearch ENDP
END
