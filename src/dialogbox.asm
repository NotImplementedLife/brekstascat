INCLUDE "src/include/macros.inc"


SECTION "Dialog Logic", ROM0

; to be caleed in vBlank/ before game loop
DialogInit::
	; load border
	loadVRAM_DOUBLE $8200, DialogBorder              , DialogBorderEnd
	loadVRAM_DOUBLE $9980, DialogFrame               , DialogFrame+32
	loadVRAM_DOUBLE $99A0, DialogFrame+32            , DialogFrame+64 ; padding
	loadVRAM_DOUBLE $99C0, DialogFrame+64            , DialogFrame+96
	loadVRAM_DOUBLE $99E0, DialogFrame+96            , DialogFrame+128
	loadVRAM_DOUBLE $9A00, DialogFrame+32            , DialogFrame+64 ; padding
	loadVRAM_DOUBLE $9A20, DialogFrame+128           , DialogFrame+160
	
	loadVRAM_DOUBLE $8300, Chars           , Chars_End
	
	xor a
	ldh [OffsetX], a
	ldh [OffsetY], a
	ldh [Iterator], a
	ret

; hl = destination tile + 2
; de = source tile     
; c  = offset (left margin-c)
;
; Cycles : 460
CopyCharLeft::
	ld a, 7                    ; 2 
.loop
	ldh [Iterator], a          ; 3
	
	; load source byte
	ld a, [de]                 ; 2
	inc de                     ; 2
	
	ld b, a                    ; 1
	ld a, c                    ; 1
	push hl                    ; 4
	call ShiftRightBA          ; 6 + 28
	pop hl                     ; 3
	inc hl                     ; 2
	or a, [hl]                 ; 2
	ld [hli], a                ; 2

	ldh a, [Iterator]          ; 3
	dec a                      ; 1
	jr nz, .loop               ; 3 | 2
	ret                        ; 4
	
; hl = destination tile + 2
; de = source tile 
; c  = offset (left margin-c)
CopyCharRight::
	ld a, 7
.loop
	ldh [Iterator], a
	
	; load source byte
	ld a, [de]
	inc de
	
	ld b, a
	ld a, c
	push hl
	call ShiftLeftBA 
	pop hl
	inc hl	
	or a, [hl]                 ; 2
	ld [hli], a                ; 2
	
	ldh a, [Iterator]
	dec a
	jr nz, .loop
	ret


; a = id of mapped character
DialogPutChar::
	; save id for later [3 cyc]
	ldh [CharId], a
	; get char tile [12 cyc]
	; hl = Chars + a*8	
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, Chars
	add hl, bc
	
	; push char graphics address (need it later)
	push hl
	
	; get char width [16 cyc]
	; hl = CharWidths + a 
	ldh a, [CharId]          ; 3
	ld b, 0                  ; 2
	ld c, a                  ; 1
	ld hl, CharWidths        ; 3
	add hl, bc               ; 2
	ld a, [hl]               ; 2
	ldh [CharWidth], a       ; 3
	          
	
	ld b, a             ; b = # of pixels needed by character
	ldh a, [OffsetX]
	
	; test if character can be drawn on current line
	add b	
	cp 128
	jr c, .skipChangeY
	xor a
	ldh [OffsetX], a
	inc a
	ldh [OffsetY], a	
.skipChangeY
	sub b
	ld c, a
	and 7
	xor 7               ; now a = # of pixels remained in current tile
	inc a
	cp a, b             ; if b<=a (char fits in tile)
	jr nc, .affectSingleTile 
	
.affectTwoTiles

	; hl = Position where char should be drawn
	; = $8000 + (OffsetX div 8)*16
	ld h, $80 
	ldh a, [OffsetY]
	add a, h
	ld h, a
	ldh a, [OffsetX]
	
	ld d, a ; backup
	; build _l
	add a, a
	and a, $F0
	ld l, a
	inc l
	inc l

	; a = 8-(OffsetX % 8)
	ld a, d
	and 7	             
	ld c, a	
	
	ldh a, [CharWidth]
	add d
	ldh [OffsetX], a
	
	pop de              ; retrieve char tile
	push de             ; pop back for later use
	call CopyCharLeft	
	
	ld a, c
	cpl
	add 9
	ld c, a
	
	inc hl
	inc hl
	
	pop de
	jr CopyCharRight
.affectSingleTile
	; hl = Position where char should be drawn
	; = $8000 + (OffsetX div 8)*16
	ld h, $80 
	ldh a, [OffsetY]
	add a, h
	ld h, a
	ldh a, [OffsetX]	
	
	ld d, a ; backup
	add a, a
	and a, $F0
	ld l, a
	inc l
	inc l
	
	ld a, d
	and 7
	ld c, a
	
	ldh a, [CharWidth]
	add d
	ldh [OffsetX], a
	;ld b,b
	
	pop de              ; retrieve char tile
	;ld b, b
	jp CopyCharLeft
	
	;ret
	
SECTION "Dialog HVars", HRAM

Iterator : DS 1

CharId: DS 1
CharWidth: DS 1

OffsetX:: DS 1
OffsetY:: DS 1


SECTION "Dialog Resources", ROM0

; Tiles for Dialog Border
DialogBorder::

DB $00, $00, $00, $00, $1f, $1f, $30, $30, $20, $20, $27, $27, $24, $24, $24, $24 ; $20
DB $00, $00, $00, $00, $f8, $f8, $0c, $0c, $04, $04, $e4, $e4, $24, $24, $24, $24 ; $21
DB $24, $24, $24, $24, $27, $27, $20, $20, $30, $30, $1f, $1f, $00, $00, $00, $00 ; $22
DB $24, $24, $24, $24, $e4, $e4, $04, $04, $0c, $0c, $f8, $f8, $00, $00, $00, $00 ; $23
DB $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00 ; $24
DB $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24 ; $25
DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; $26 - space

DialogBorderEnd::


; Dialog in tilemap
DialogFrame::

DB $26, $26, $26, $26, $26, $26, $20, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $21, $26, $26, $26, $26, $26, $26, ; top
DB $26, $26, $26, $26, $26, $26, $25, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $25, $26, $26, $26, $26, $26, $26, ; padding
DB $26, $26, $26, $26, $26, $26, $25, $26, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $26, $25, $26, $26, $26, $26, $26, $26, ; line 1
DB $26, $26, $26, $26, $26, $26, $25, $26, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $26, $25, $26, $26, $26, $26, $26, $26, ; line 2
DB $26, $26, $26, $26, $26, $26, $22, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $23, $26, $26, $26, $26, $26, $26, ; bottop

DialogFrameEnd::


; Index of char widths
CharWidths::

; Digits 0-9
DB 6, 4, 6, 6, 6, 6, 6, 6, 6, 6  
; Punctuation (. ! ? , - ')
DB 2, 4, 4, 3, 5, 3        
; Capital letters (A-Z)      
DB 7, 6, 7, 6, 6, 6, 7, 7, 2, 4, 6, 6, 6, 6, 7, 6, 7, 6, 6, 6, 7, 7, 6, 6, 6, 6






