SECTION "Call HL", ROM0

CallHL::
    jp hl
	
SECTION "Call DE", ROM0

CallDE::
    push de
    ret
	
SECTION "Call BC", ROM0

CallBC::
    push bc
    ret
	
;-------------------------------------------------