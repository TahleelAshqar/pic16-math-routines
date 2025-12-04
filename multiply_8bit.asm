; Tahleel Ashqar, ID: 212516421 
; EX: 1, Q: 1

LIST    P=16F877
INCLUDE "P16F877.INC"

; INPUT: 0x40, 0x41
; OUTPUT: 0X40*X41 => 0X42, 0X43

;Question (1):
CLRF    0x42 ; set low  = 0
CLRF    0x43 ; set high = 0

MOVLW   0xFF      ; 1 -> W
MOVWF   0x40   ; W -> 0x40

MOVLW 	2 		; 2 -> W
MOVWF	0x41	; X -> 0x41 


MULT_LOOP:
MOVF    0x41, 0 ; load 0x41 to register W
BTFSC   STATUS, 0 ; if multiplier is zero then the result is zero
GOTO    DONE ; end the program

;else: result = result + 0x40
MOVF    0x40, 0 ; W = 0x40
ADDWF   0x42, 1 ; add W to 0x42 (lower bytes result)
; if there is carry then:
BTFSC   STATUS, 0
INCF    0x43, 1 ; increment high byte

; if no carry, only do this:
DECF    0x41, 0 ;multiplier--

GOTO    MULT_LOOP ; add again until 0x41 equals 0, that means we added 0x40 was added to result 0x41 times

DONE:
nop
END
