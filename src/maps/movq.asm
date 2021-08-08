INCLUDE "src/include/constants.inc"

SECTION "MC Movement Queue", WRAM0, ALIGN[8]

; MC Movement Instructions Queue
; This tells the engine to perform to perform MC-related operations
; such as "Go down 4 pixels", "Change sprite preset to facing Left" etc.
; A frame limiter tells when the engine should pause execution and resume it the next frame
; McMovQ codes:
; $00 - terminate (reset MCMovQEnabled and "zero" the whole queue)
; $01 - move up by 2 px
; $02 - move down by 2 px
; $03 - move left by 2 px
; $04 - move right by 2 px
; $05 - terminate if not valid step
; %01uuAAAA - change sprite preset to %AAAA
; $FF - halt till next frame
MCMovQ::
	DS 20

; 1/0 to tell when the MovQ must be processed
MCMovQEnabled::
	DS 1
	
; index of current instruction
MCMovQIndex::
	DS 1
	
MCMovQNextFrameInterrupt::
	DS 1
	
SECTION "MC Movement Queue Logic", ROMX, BANK[4]

MovQueueInit::
MovQueueReset::
	ld hl, MCMovQ
	xor a
	REPT(19)
	ld [hli], a
	ENDR
	ld [MCMovQIndex], a
	ld [MCMovQNextFrameInterrupt], a
	ld [MCMovQEnabled], a
	
	; as MovQueueReset follows after very character step (+-16 pixels movement),
	; this is a good opportunity to update Step Parity
	ldh a, [hStepParity]
	xor 16 ; idk why `xor 1` makes rSCY change unexpectedly
	ldh [hStepParity], a
	;ld b,b
	ld a, 1
	ldh [hWalkingCooldown], a
	xor a ; buggy somewhere, a must be 0 at the end of this func
	;ld b,b
	ret
	
; de = MovQ instrution
MovQueueLaunch::
	ld hl, MCMovQ
	
	REPT(19)
	ld a, [de]
	inc de
	ld [hli], a
	ENDR
	
	ld a, 1
	ld [MCMovQEnabled], a
	ret
	
MovQueueProcess::
	ld a, [MCMovQEnabled]
	or a
	ret z ; ignore if queue is disabled
	ld a, [MCMovQNextFrameInterrupt]
	or a
	ret nz ; ignore if execution was left on the next frame
	ld a, [MCMovQIndex]
	ld l, a
	ld h, HIGH(MCMovQ)
	inc a
	ld [MCMovQIndex], a
	ld a, [hl]
	
	; each of the following `call z` will terminate MovQueueProcess
	
	or a ; cp 0
	call z, MovQueueReset
	
	cp $01
	call z, MovQ_MoveUp
	
	cp $02
	call z, MovQ_MoveDown
	
	cp $03
	call z, MovQ_MoveLeft
	
	cp $04
	call z, MovQ_MoveRight
	
	cp $05
	call z, MovQ_TerminateIfNotValid
	
	cp $FF
	call z, MovQ_NextFrame
	
	bit 6, a ; only %01uuAAAA remains to be treated
	ret z
	and $0F
	cp MC_FRONTW
	jr z, .updateStep
	cp MC_BACKW
	jr z, .updateStep
	jr .fin
.updateStep
	ld hl, hStepParity
	swap a
	add [hl]
	swap a
.fin
	ld [wMC_Preset], a
	
	ret
	
SECTION "MOVQ Commands Implementation", ROMX, BANK[4]
; MovQ commands implementation
MovQ_MoveUp::
	ld hl, hPMCY
	dec [hl]
	dec [hl]
	pop af    ; fake return 
	ret       ; this exits directly from MovQueueProcess
	
MovQ_MoveDown::
	ld hl, hPMCY
	inc [hl]
	inc [hl]
	pop af
	ret
	
MovQ_MoveLeft::
	ld hl, hPMCX
	dec [hl]
	dec [hl]
	pop af
	ret
	
MovQ_MoveRight::
	ld hl, hPMCX
	inc [hl]
	inc [hl]
	pop af
	ret
	
MovQ_NextFrame::
	ld a, 1
	ld [MCMovQNextFrameInterrupt], a
	pop af
	ret
	
; must execute before a the walking animation starts
; in case the step is not valid, execution stops
MovQ_TerminateIfNotValid::
	ldh a, [hIsValidStep]
	or a
	ret z	
	jp MovQueueReset

	
MACRO _movQ_ChangePreset
	DB (%01000000 | ((\1) & $0F))
ENDM

MACRO _movQ_GoUp
	DB $01
ENDM

MACRO _movQ_GoDown
	DB $02
ENDM

MACRO _movQ_GoLeft
	DB $03
ENDM

MACRO _movQ_GoRight
	DB $04
ENDM

MACRO _movQ_Terminate
	DB $00
ENDM

MACRO _movQ_NextFrame
	DB $FF
ENDM

MACRO _movQ_TerminateIfNotValidStep
	DB $05
ENDM
	
SECTION "MOVQ Instructions", ROMX, BANK[4]

MovQInstr_PositionUp::
	_movQ_ChangePreset MC_BACK0
	_movQ_Terminate

MovQInstr_Up::
	_movQ_TerminateIfNotValidStep
	_movQ_ChangePreset MC_BACKW
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_ChangePreset MC_BACK0
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	_movQ_NextFrame
	_movQ_GoUp
	;_movQ_NextFrame
	_movQ_Terminate

MovQInstr_PositionDown::
	_movQ_ChangePreset MC_FRONT0
	_movQ_Terminate

MovQInstr_Down::
	_movQ_TerminateIfNotValidStep
	_movQ_ChangePreset MC_FRONTW
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_ChangePreset MC_FRONT0
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	_movQ_NextFrame
	_movQ_GoDown
	;_movQ_NextFrame
	_movQ_Terminate
	
MovQInstr_PositionLeft::
	_movQ_ChangePreset MC_LEFT0
	_movQ_Terminate
	
MovQInstr_Left::
	_movQ_TerminateIfNotValidStep
	_movQ_ChangePreset MC_LEFTW
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_ChangePreset MC_LEFT0
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	_movQ_NextFrame
	_movQ_GoLeft
	;_movQ_NextFrame
	_movQ_Terminate
	
MovQInstr_PositionRight::
	_movQ_ChangePreset MC_RIGHT0
	_movQ_Terminate
	
MovQInstr_Right::
	_movQ_TerminateIfNotValidStep
	_movQ_ChangePreset MC_RIGHTW
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_ChangePreset MC_RIGHT0
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	_movQ_NextFrame
	_movQ_GoRight
	;_movQ_NextFrame
	_movQ_Terminate
	

	
	
	
