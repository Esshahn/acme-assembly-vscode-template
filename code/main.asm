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
; BASIC header
;==========================================================

* = $0801

                !byte $0B, $08
                !byte $E2                     ; BASIC line number:  $E2=2018 $E3=2019 etc       
                !byte $07, $9E
                !byte '0' + entry % 10000 / 1000        
                !byte '0' + entry %  1000 /  100        
                !byte '0' + entry %   100 /   10        
                !byte '0' + entry %    10       
                !byte $20, $3a, $20        
                !byte $00, $00, $00           ; end of basic


;==========================================================
; CODE
;==========================================================

entry

                lda #$00
                sta $d020
                sta $d021
                rts
