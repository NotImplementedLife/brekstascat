INCLUDE "src/include/macros.inc"

_WAIT EQU $00
_SHOW EQU $01
_HIDE EQU $02
_ENDF EQU $03

SECTION "Display engine", ROMX, BANK[3]

DiEn_Init::
	xor a
	ld [wCmdCnt], a
	ld [wCmdHub.isExecuting], a
	ld [wCmdHub.cmdCode], a
	ld [wCmdHub.attr0], a
	ld [wCmdHub.attr1], a
	ld [wCmdHub.attr2], a
	ld [wEndFlag], a
	ret
	
DiEn_LoadNext::
	;ld b,b
	; check if hub is busy
	ld a, [wCmdHub.isExecuting]
	or a
	jr nz, DiEn_Resume ; action in progress, execute it
	
	ld a, [wCmdCnt]
	ld l, a
	ld h, HIGH(CmdSeries)
	ld a, [hl]
	ld [wCmdHub.cmdCode], a
	sla a
	
	ld hl, wCmdCnt
	inc [hl]
	
	ld l, a
	ld h, HIGH(DiEn_Actions)
	
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; instruction loaded
	
	ld a, 1
	ld [wCmdHub.isExecuting], a
	jp CallHL
	
DiEn_Resume:
	ld a, [wCmdHub.cmdCode]
	sla a
	ld l, a
	ld h, HIGH(DiEn_Actions)
	; load instruction
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp CallHL

;--------------------------------------------------------------
DiEn_WAIT:
;--------------------------------------------------------------
	; check if timer is 0 (aka unitialized)
	ld a, [wCmdHub.attr0]
	or a
	jr nz, .tick
	; otherwise, get timer from the first command parameter
	ld a, [wCmdCnt]
	ld l, a
	ld h, HIGH(CmdSeries)
	ld a, [hl]
	
	ld hl, wCmdCnt
	inc [hl]
	
.tick
	dec a ; just decreasing the timer has the effect of skipping frame
	ld [wCmdHub.attr0], a
	or a  ; if timer reached 0, the task is complete
	ret nz
	xor a
	ld [wCmdHub.isExecuting], a ; terminate the action
	ret
	
; the most costful instruction of all
; use of attributes:
; attr0 - step:
;          0 = initialize
;          1 = copy to OAM
;          2 = Change Palette 1
;          3 = Change Palette 2
;          4 = terminate
;--------------------------------------------------------------
DiEn_SHOW:
;--------------------------------------------------------------
	ld a, 1
	ld [wCmdHub.isExecuting], a
	; check current step
	ld a, [wCmdHub.attr0]
	or a
	jr z, DiEn_SHOW_Helper0
	cp a, 1
	jr z, DiEn_SHOW_Helper1
	cp a, 2
	jr z, DiEn_SHOW_Helper2
	cp a, 3
	jr z, DiEn_SHOW_Helper3
	cp a, 4
	jr z, DiEn_SHOW_Helper4
	ret

DiEn_SHOW_Helper0:
	ld a, %11000000
	ld [rOBP1], a

	; read address from CmdSeries into hl
	ld a, [wCmdCnt]
	ld l, a
	ld h, HIGH(CmdSeries)
	ld a, [hli]
	ld l, [hl]
	ld h, a
	
	; copy hl to bc
	ld a, h
	ld d, a
	ld a, l
	ld e, a
	
	ld hl, ShadowOAM + 15*4
	ld bc, 17*4
	call loadMemory
	
	; increase Command Count
	ld hl, wCmdCnt
	inc [hl]
	inc [hl]
	
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	
	initOAM ShadowOAM
	
	ret

DiEn_SHOW_Helper1:
	ld a, %11000000
	ld [rOBP1], a
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	ret
	
DiEn_SHOW_Helper2:
	ld a, %11010000
	ld [rOBP1], a
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	ret
	
DiEn_SHOW_Helper3:
	ld a, %11100100
	ld [rOBP1], a
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	ret
	
DiEn_SHOW_Helper4:
	xor a
	ld [wCmdHub.isExecuting], a ; terminate the action
	ld [wCmdHub.attr0], a ; cleanup
	ret
	

;--------------------------------------------------------------
DiEn_HIDE:
;--------------------------------------------------------------
	ld a, 1
	ld [wCmdHub.isExecuting], a
	; check current step
	ld a, [wCmdHub.attr0]
	or a
	jr z, DiEn_HIDE_Helper0
	cp a, 1
	jr z, DiEn_HIDE_Helper1
	cp a, 2
	jr z, DiEn_HIDE_Helper1
	cp a, 3
	jr z, DiEn_HIDE_Helper3
	ret
	
DiEn_HIDE_Helper0:
	ld a, %11010000
	ld [rOBP1], a
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	ret
	
DiEn_HIDE_Helper1:
	ld a, %11000000
	ld [rOBP1], a
	; go to next step
	ld hl, wCmdHub.attr0
	inc [hl]
	ret

DiEn_HIDE_Helper3:
	ld hl, ShadowOAM + 15*4
	ld bc, 17*4
	call fillMemory0 ; reset OAM
	
	initOAM ShadowOAM
	xor a
	ld [wCmdHub.isExecuting], a ; terminate the action
	ld [wCmdHub.attr0], a ; cleanup
	ret

;--------------------------------------------------------------
DiEn_ENDF:
;--------------------------------------------------------------
	ld b,b
	ld a, 1
	ld [wEndFlag], a
	ret
	
SECTION "Display Engine Actions", ROMX, BANK[3], ALIGN[8]
DiEn_Actions: 
	DW DiEn_WAIT, DiEn_SHOW, DiEn_HIDE, DiEn_ENDF

SECTION "Display Engine Vars", WRAM0

; Command counter (for CmdSeries)
wCmdCnt:
	DS 1

; Command Hub [5 bytes]
; [CommandHub + 0]    -> 1 if a command is executing, 0 otherwise
; [CommandHub + 1]    -> Command Code
; [CommandHub + 2..4] -> Work memory
wCmdHub: 
.isExecuting: DS 1
.cmdCode:  DS 1
.attr0: DS 1
.attr1: DS 1
.attr2: DS 1

wEndFlag::
	DS 1


SECTION "Display Command Series", ROMX, BANK[3], ALIGN[8]

CmdSeries::
DB _WAIT, 20
DB _SHOW, HIGH(DiEn_2021), LOW(DiEn_2021)
DB _WAIT, 55
DB _HIDE
DB _WAIT, 40
DB _SHOW, HIGH(DiEn_NILPresents), LOW(DiEn_NILPresents)
DB _WAIT, 55
DB _HIDE
DB _WAIT, 30
DB _ENDF

