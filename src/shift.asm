; Thanks : Eievui

SECTION "Shift Left BA", ROM0

; Do a = b << a [(12 + a) cycles]
ShiftLeftBA::
	cpl                        ; 1
	add 9                      ; 2
	ld l, a	                   ; 1
	ld h, HIGH(ShiftLeftBlock) ; 2
	ld a, b                    ; 1
	jp hl                      ; 1

SECTION "Shift Right BA", ROM0	
; Do a = b >> a [(13 + 2*a) cycles]
ShiftRightBA::
	cpl                          ; 1
	add 9                        ; 2
	add a, a                     ; 1
	ld l, a                      ; 1
	ld h, HIGH(ShiftRightBlock)  ; 2
	ld a, b                      ; 1
	jp hl                        ; 1
	
	
SECTION "ShiftL Block", ROM0, ALIGN[8]
ShiftLeftBlock: 
REPT(8)
	add a, a                 ; 1 x 8
ENDR
	ret                      ; 4
SECTION "ShiftR Block", ROM0, ALIGN[8]
ShiftRightBlock:
REPT(8)
	srl a
ENDR
	ret                      ; 4
