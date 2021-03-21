;==========================================================
; 6502 assembly template for VSCode
; created 2019 by Ingo Hinterding // awsm of Mayday
;
; Check github repo for setup instructions & help
; https://github.com/Esshahn/acme-assembly-vscode-template
; If you found this useful, I would be happy to know :)
; 
; https://www.twitter.com/awsm9000
; http://www.awsm.de
;==========================================================
 
;==========================================================
; LABELS
; Comment or uncomment the lines below 
; Depending on your target machine
;==========================================================

; VC20
;BGCOLOR       = $900f
;BORDERCOLOR   = $900f
;BASIC         = $1001
;SCREENRAM     = $1e00

; C16, C116, Plus/4
;BGCOLOR      = $ff15
;BORDERCOLOR  = $ff19
;BASIC        = $1001
;SCREENRAM    = $0c00

; C128
;BGCOLOR       = $d020
;BORDERCOLOR   = $d021
;BASIC         = $1c01
;SCREENRAM     = $0400

; C64
BGCOLOR       = $d020
BORDERCOLOR   = $d021
BASIC         = $0801
SCREENRAM     = $0400

;==========================================================
; BASIC header
;==========================================================

* = BASIC

                !byte $0b, $08
                !byte $E3                     ; BASIC line number:  $E2=2018 $E3=2019 etc       
                !byte $07, $9E
                !byte '0' + entry % 10000 / 1000        
                !byte '0' + entry %  1000 /  100        
                !byte '0' + entry %   100 /   10        
                !byte '0' + entry %    10             
                !byte $00, $00, $00           ; end of basic


;==========================================================
; CODE
;==========================================================

entry

                lda #$00                ; the color value
                sta BGCOLOR             ; change background color
                sta BORDERCOLOR         ; change border color

                ldy #$0b                ; the string "hello world!" has 12 (= $0b) characters

character_loop

                lda hello,y             ; load character number y of the string
                sta SCREENRAM,y         ; save it at position y of the screen ram
                dey                     ; decrement y by 1
                bpl character_loop      ; is y positive? then repeat
                rts                     ; exit the program

hello           !scr "hello world!"     ; our string to display
