SECTION "Call r16", ROM0

CallHL::
    jp hl

CallDE::
    push de
    ret

CallBC::
    push bc
    ret
	
;-------------------------------------------------