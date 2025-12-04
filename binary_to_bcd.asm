; Tahleel Ashqar, ID: 212516421 
; EX: 1, Q: 2

LIST    P=16F877
INCLUDE "P16F877.INC"
 __CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_OFF & _HS_OSC & _WRT_ENABLE_ON & _LVP_OFF & _DEBUG_OFF & _CPD_OFF


; Question (2):
; INPUT:  0x60  (binary)
; OUTPUT: 0x61 = Units
;         0x62 = Tens
;         0x63 = Hundreds

; Clear result registers
CLRF    0x61 ; units
CLRF    0x62 ; tens
CLRF    0x63 ; hundreds

; load number to W:
MOVLW   123      ; 123 -> W
MOVWF   0x60   ; W -> 0x60
MOVWF   0x20        ; temp register to help store values

; Count hundreds
COUNT_100:
        MOVF    0x20, W
        SUBLW   100         ; W = 100 – 0x20, if w now is negative then:
        BTFSS   STATUS, 0   ; if the result value was negative, C = 0, no need to count hundreds.

		GOTO    SUB_100     ; if value > 100, subtract 100

        GOTO    COUNT_10    ; count tens now

SUB_100:
        MOVLW   100
        SUBWF   0x20, 1     ; 0x20 value -= 100 (from W)
        INCF    0x63, 1     ; hundreds++
        GOTO    COUNT_100

;---------------------------------
; Count tens
COUNT_10:
        MOVF    0x20, W
        SUBLW   10 			; W = 10 - 0x20 , if w is now negatice then:
        BTFSS   STATUS, 0 	; if the result value is negative, C = 0, no need to count tens.

		GOTO 	SUB_10

        GOTO    UNITS_DONE	; check the last digits

SUB_10:
        MOVLW   10
        SUBWF   0x20, F     ; value -= 10
        INCF    0x62, F     ; tens++
        GOTO    COUNT_10

;--------------------------------------------
; Remaining = units
UNITS_DONE:
        MOVF    0x20, W
        MOVWF   0x61        ; units = leftover

        END
