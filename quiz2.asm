section .text
		global _start

_start:
        mov eax, [a] ;Move value at a to address eax
        mov dl, [b]; Move value at b into address dl because mul cannot take a literal int
		mul dl ;Implicit multiply value in dx:ax with value in dl, store result at eax
		mov [result1], eax ;Move value at eax into address result1
        
        mov eax, [c] ;Move value at c to address eax
        mov dl, [d]; Move value at d into address dl because mul cannot take a literal int
		mul dl ;Implicit multiply value in dx:ax with value in dl, store result at eax
		mov [result2], eax ;Move value at eax into address result1
        
        mov eax, [result1] 
        mov ebx, [result2] 
        add eax, ebx ;add eax and ebx, store in eax
        mov [x], eax ;Move value at eax into address x

		mov eax,1
		int 0x80

section .data
		a DD 1 ; a is assigned 1
		b DD 2 ; b is assigned 2
		c DD 3 ; c is assigned 3
		d DD 4 ; d is assigned 4
segment .bss
        result1 resd 1 ;Should be 2
        result2 resd 1 ;Should be 12
		x resd 1 ;Reserve double word to avoid overflow error. Should be 14 at the end