INCLUDE "src/include/macros.inc"

SECTION "PuzzleTimer", ROM0

RenderTimer::
	call rtcGetSeconds
	
	ld c, a
	
	and $0F
	ld e, a
	
	ld a, c
	and $F0
	swap a
	ld c, a
	
	sla c
	sla e
	
	
	ld a, e
	add $E0
	ld [$9810], a
	inc a
	ld [$9830], a
	
	ld a, c
	add $E0
	ld [$980F], a
	inc a
	ld [$982F], a
	
	call rtcGetMinutes
	
	ld c, a
	
	and $0F
	ld e, a
	
	ld a, c
	and $F0
	swap a
	ld c, a
	
	sla c
	sla e
	
	
	ld a, e
	add $E0
	ld [$980D], a
	inc a
	ld [$982D], a
	
	ld a, c
	add $E0
	ld [$980C], a
	inc a
	ld [$982C], a
	
	
	call rtcGetHours
	or a
	ret z
	
	and $0F
	
	
	cp 8
	call nc, TooLongTimePlaying
	
	ld e, a
	sla e
	
	ld a, e
	add $E0
	ld [$980A], a
	inc a
	ld [$982A], a
	
	; add the ":" before minutes
	ld a, $BE
	ld [$980B], a
	inc a
	ld [$982B], a
	
	ret


; "Time bomb"?
; Ok, I don't have anything with people wanting to spend more than
; 8 hours trying to solve a sliding puzzle, but putting this time
; bomb makes my implementation easier. 
;
; Honestly, I have no clue right now how long it takes to solve
; for example the 6x6 puzzle, but I think 8 hours is far more than 
; enough. I'm curious if a real Gameboy battery life can sustain
; such a long game session :))
;
; Therefore: show a nice Game Over message after 8h have passed
; and return to the map.
TooLongTimePlaying::
	; clear the timer
	ld a, $FB
	ld hl, $980A
	REPT(7)
	ld [hli], a
	ENDR
	ld hl, $982A
	REPT(7)
	ld [hli], a
	ENDR
	call waitForVBlank
	
	; Tiles $E0-$F3 are unused, replace them with Game Over message tiles
	
	ld hl, $8E00
	ld de, GameOverTiles
	ld bc, GameOverTilesEnd
	call loadMemoryDOUBLE
	
	ld hl, ShadowOAM
	ld de, GameOverSprites
	ld bc, 80
	call loadMemory
	
	call waitForVBlank
	initOAM ShadowOAM
	
	call waitForVBlank

	ld b, 3
	call rand
	inc a
	ld c, a
	ld a, b
	ld b, c
	call DivAB
	inc d
	inc e
.loop
	call waitForVBlank
	
	ld hl, ShadowOAM
	ld b, 20
	.innerLoop
		ld a, [hl]
		add d
		ld [hli], a
		ld a, [hl]
		add e
		ld [hli], a
		inc hl
		inc hl
		dec b
		jr nz, .innerLoop
	
	ld a, [ShadowOAM]
	cp $7D
	push af
	call nc, InvertD
	pop af
	cp $13
	call c, InvertD
	
	ld a, [ShadowOAM + 1]
	cp $4D
	push af
	call nc, InvertE
	pop af
	cp $0C
	call c, InvertE
	
	call waitForVBlank
	call updateJoypadState
	ld   a, [wJoypadPressed]
	or a
	jr nz, .end
	
	call waitForVBlank
	initOAM ShadowOAM
	jr .loop

.end:
	pop af ; exit from TooLongTimePlaying
	pop af ; exit from RenderTimer
	
	; now find the caller entry by puzzle size and exit game loop
	
	ld a, [wPuzzle_Size]
	
	cp 3
	jp z, _mAction_EnterPuzzleRoomE.end
	
	cp 4
	jp z, _mAction_EnterPuzzleRoomM.end
	
	cp 5
	jp z, _mAction_EnterPuzzleRoomH.end
	
	;cp 6
	jp _mAction_EnterPuzzleRoomX.end
	
InvertD:
	ld a, d
	cpl
	inc a
	ld d, a
	ret
	
InvertE:
	ld a, e
	cpl
	inc a
	ld e, a
	ret
