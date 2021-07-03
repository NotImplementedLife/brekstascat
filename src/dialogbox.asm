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


; hl = destination tile
; bc = source tile
; d  = destination offset  (0..7)
; e  = source offset (0..7)
; copies graphics data from bc to hl as follows:
; 
; Let Di = d7d6d5...d0 be a line from hl
; and Si = s7s6s5...s0 be a line from bc
;
;   destination offset (d)       8 - d
; <------------------------><------------->
; |                        |
; | d7   d6   d5   d4   d3 | d2   d1   d0 |
;           | s7   s6   s5 |(s4   s3   s2)| s1   s0
;           |   ignored    |this is copied| ^-- what remains in the
;           <-------------->                    right is discarded
;           source offset (e)
;
; Formulae:
;      (1) Di &= (1<<(9-d)) - 1   // zero the right part
;      (2) Di |= (Si << e)        // get rid of what's not needed
;                    >> d         // align with the destination offset

DialogCopyPartialTile::
	; Optimization: save d
	ld a, d
	ldh [SaveD], a
	; Compute d = (1<<(9 - d)) - 1
	dec d
	ld a, d
	xor $FF
	add 9
	ld d, a
	; up to this point, d = 9 - d
	ld a, 1
	inc d
	dec d
	jr z, .skip_sla
.sla_loop
	sla a
	dec d
	jr nz, .sla_loop
.skip_sla:
	dec a
	ld d, a
	
	; Hope everything is correct and d is what it should be :))
	
	; now, our formulae become:
	; (1) Di &= d
	; (2) Di |= (Si << e)
	; let's finish this
	
	ld a, 16  ; there're 16 bytes per tile, right?
	;ld b,b
.loop
	ldh [Iterator], a
	
	ld a, d
	and a, [hl]
	ld [hl], a   ; temporary store after (1)
	
	push de
	
	ldh a, [SaveD]
	ld d, a
	
	ld a, [bc]   ; load source
	inc bc
	push bc
	
	ld b, e     
	inc b
	dec b
	jr z, .skip_sla_src
.sla_src_loop    ; do Si << e
	sla a
	dec b
	jr nz, .sla_src_loop
.skip_sla_src:

	ld b, d
	inc b
	dec b
	jr z, .skip_srl_src

.srl_src_loop    ; do Si >> d
	srl a
	dec b
	jr nz, .srl_src_loop
.skip_srl_src:

	pop bc
	pop de
	
	or a, [hl]
	ld [hli], a  ; aaand that should do the trick
	
	ldh a, [Iterator]
	dec a
	jr nz, .loop
	
	ret
	
; a = id of mapped character
DialogPutChar::
	; save id for later [3 cyc]
	ldh [CharId], a
	; get char tile [13 cyc]
	; bc = a*16
	swap a       ; 2
	ld b, a      ; 1
	and $F0      ; 1
	ld c, a      ; 1
	ld a, b      ; 1
	and $0F      ; 1
	ld b,a       ; 1
	; hl = Chars + bc
	ld hl, Chars ; 3
	add hl, bc   ; 2
	
	; push char tile (need it later)
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
	
	; 
	ld b, a             ; b = # of pixels needed by character
	ldh a, [OffsetX]
	ld c, a
	and 7
	xor 7               ; now a = # of pixels remained in current tile
	cp a, b             ; if b<=a (char fits in tile)
	jr nc, .affectSingleTile 
	
.affectTwoTiles
	
	ret
.affectSingleTile
	; hl = Position where char should be drawn
	; = $8000 + 
	ld hl, $8000
	ldh a, [OffsetX]
	ld c, a
	ld b, 0
	add hl, bc
	
	pop de              ; retrieve char tile
	ret
	
SECTION "Dialog HVars", HRAM

Iterator : DS 1
SaveD: DS 1

CharId: DS 1
CharWidth: DS 1

OffsetX: DS 1
OffsetY: DS 1


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






