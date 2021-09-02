INCLUDE "src/include/macros.inc"

SECTION "Save Vars", SRAM[$A000]

sSRAMKEY: DS 16

sNowhereIntroComplete:: DS 1 ; 0 = no, 1 = yes

sCatCoins:: DS 1

sSnakeCleared:: DS 1

; when player completes the tutorial (places the stones in 
; the playground room in reverse order), he receives some coins
; this byte controls the bonus to be given only once
sTutorialBonusGiven:: DS 1

; the free matrix in the Playground map
sTutorialMatrix::
	DS 9  ; 3x3, 1..8, 0 = free square


SECTION "Save Key", ROM0, ALIGN[8]

; .sav file seems to contains random values, mostly $00 & $FF
; so let's bring some order in the chaos :))
; this is a 16-byte key to detect whether the SRAM has been
; previously written
; compare this SRAMKey to $A000-$A00F region
SRAM_Key:
DW $1771, $7528, $6725, $0042, $31C5, $B141, $D0D3, $EE00

SRAM_Init::
	; copy key to SRAM
	ld b, HIGH(SRAM_Key)
	ld h, $A0
	xor a
	ld c, a
	ld l, a
.loop
	ld a, [bc]
	ld [hli], a
	inc c
	ld a, c
	and 15
	jr nz, .loop
	; now that SRAM key is written, init the save data
	xor a
	ld [sNowhereIntroComplete], a
	ld [sCatCoins], a
	ld [sSnakeCleared], a
	ld [sTutorialBonusGiven], a
	; init all the high score tables
	; place an 08 on hours place to know that 
	; the respective puzzle was never solved
	
	ld hl, _3x3_PuzzlesList
	call SRAM_InitPuzzleList
	
	ld hl, _4x4_PuzzlesList
	call SRAM_InitPuzzleList
	
	ld hl, _5x5_PuzzlesList
	call SRAM_InitPuzzleList
	
	ld hl, _6x6_PuzzlesList
	call SRAM_InitPuzzleList
	
	
	
	
SRAM_InitTutorialMatrix::
	xor a	
	ld [sTutorialMatrix+8], a
	ld hl, sTutorialMatrix
	ld b, 8
.loop
	inc a
	ld [hli], a
	dec b
	jr nz, .loop
	
	ret
	
SRAM_InitPuzzleList::
	ld a, [hli] ; get puzzle count
	ld c, a
	
.loop
	ld a, [hli] ; get BANK
	setBank a
	inc hl ; skip HIGH
	
	push hl

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, 8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	
	pop hl
	inc hl 
	inc hl 
	
	dec c
	jr nz, .loop
	
	setBank 1
	ret
	

SRAM_CheckWritten::
	ld b, HIGH(SRAM_Key)
	ld h, $A0
	xor a
	ld c, a
	ld l, a
.loop
	ld a, [bc]
	cp [hl]
	jp nz, SRAM_Init ; if key not found, init SRAM
	inc c
	inc l
	ld a, c
	and 15
	jr nz, .loop
	ret


