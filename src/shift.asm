; Thanks : Eievui

SECTION "Shift", ROM0

; Do a = b << a [(13 + a) cycles]
ShiftLeftBA::
	dec a                      ; 1
	xor $FF                    ; 1
	add 8                      ; 2
	ld l, a	                   ; 1
	ld h, HIGH(ShiftLeftBlock) ; 2
	ld a, b                    ; 1
	jp hl                      ; 1
	
; Do a = b >> a
ShiftRightBA::
	dec a
	xor $FF
	add 8
	add a, a
	ld l, a
	ld h, HIGH(ShiftRightBlock)
	ld a, b
	jp hl
	
	
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
	ret
