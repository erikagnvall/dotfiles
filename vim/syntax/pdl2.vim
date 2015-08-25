" Vim syntax file
" Language: PDL2
" Maintainer: Erik Jansson
" Latest Revision: 18 February 2015

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword     pdl2Keyword         ABORT ABOUT ACTIVATE ACTIVATES
syn keyword     pdl2Keyword         ADVANCE AFTER ALARM ALL
syn keyword     pdl2Keyword         ALONG AND ANY ANYERROR
syn keyword     pdl2Keyword         ARM ASSERT AT ATTACH
syn keyword     pdl2Keyword         AWAY BEFORE BEGIN BREAK
syn keyword     pdl2Keyword         BY BYPASS CALL CALLS
syn keyword     pdl2Keyword         CANCEL CASE CATCH CLASS
syn keyword     pdl2Keyword         CLOSE CONDITION CONNECT CONST
syn keyword     pdl2Keyword         CONTINUE CURRENT CYCLE CYCLES
syn keyword     pdl2Keyword         DEACTIVATE DEACTIVATES DECODE DELAY
syn keyword     pdl2Keyword         DETACH DISABLE DISTANCE DIV
syn keyword     pdl2Keyword         DO DOWNTO DV_CNTRL ENABLE
syn keyword     pdl2Keyword         ENCODE END ENDCONDITION ENDFOR 
syn keyword     pdl2Keyword         ENDMOVE ENDOPEN ENDSELECT ENDTRY
syn keyword     pdl2Keyword         ENDWHILE ERRORCLASS ERRORNUM EVENT
syn keyword     pdl2Keyword         EXECS EXIT EXPORTED FILE
syn keyword     pdl2Keyword         FINAL FOR FROM GLOBAL GOTO
syn keyword     pdl2Keyword         GOTOS HAND HOLD IMPORT
syn keyword     pdl2Keyword         IN INTERRUPT LOCK LONGJUMP
syn keyword     pdl2Keyword         MC MJ ML MOD
syn keyword     pdl2Keyword         MOVE MOVEFLY MV NEAR
syn keyword     pdl2Keyword         NL NODATA NODISABLE NOHOLD
syn keyword     pdl2Keyword         NOSAVE NOT NOTEACH OF
syn keyword     pdl2Keyword         OPEN OR PATH PAUSE
syn keyword     pdl2Keyword         PAUSES PERCENT PLC POWERUP
syn keyword     pdl2Keyword         PRIORITY PROGRAM PROG_ARM PULSE
syn keyword     pdl2Keyword         PURGE RAISE READ RELATIVE
syn keyword     pdl2Keyword         RELAX REPEAT RESUME RETRY
syn keyword     pdl2Keyword         RETURN ROL ROR ROUTINE
syn keyword     pdl2Keyword         SCAN SEGMENT SELECT SETJUMP
syn keyword     pdl2Keyword         SHL SHR SIGNAL SKIP
syn keyword     pdl2Keyword         STACK START STEP STOP
syn keyword     pdl2Keyword         SYNCMOVE SYNCMOVEFLY TIL TIME
syn keyword     pdl2Keyword         TO TRY TYPE UAL
syn keyword     pdl2Keyword         UNLOCK UNPAUSE UNPAUSES UNTIL
syn keyword     pdl2Keyword         VAR VIA VOID WAIT
syn keyword     pdl2Keyword         WHEN WHILE WINDOW WITH
syn keyword     pdl2Keyword         WRITE XOR YELD

hi def link     pdl2Keyword         Keyword

" Conditional
syn keyword     pdl2Conditional     IF THEN ELSE ENDIF
hi def link     pdl2Conditional     Conditional

" Types
syn keyword     pdl2Type            INTEGER ARRAY BOOLEAN JOINTPOS
syn keyword     pdl2Type            POSITION REAL SEMAPHORE VECTOR VEC
syn keyword     pdl2Type            XTNDPOS STRING RECORD ENDRECORD
syn keyword     pdl2Type            ENDNODEDEF NODEDEF

hi def link     pdl2Type            Type

" Comments
syn keyword     pdl2Todo            contained TODO FIXME XXX BUG
syn cluster     pdl2CommentGroup    contains=pdl2Todo
syn region      pdl2Comment         start="--" end="$" contains=@pdl2CommentGroup,@Spell
hi def link     pdl2Comment         Comment
hi def link     pdl2Todo            Todo


" Strings
syn region      pdl2String          start=+"+ end=+"+
syn region      pdl2UnicodeString   start=+'+ end=+'+

hi def link     pdl2String          String
hi def link     pdl2UnicodeString   String

" Numbers
syn match       pdl2DecimalInt      "\<\d\+\([Ee]\d\+\)\?\>"
syn match       pdl2HexadecimalInt  "\<0x\x\+\>"
syn match       pdl2OctalInt        "\<0\o\+\>"
syn match       pdl2OctalError      "\<0\o*[89]\d*\>"

hi def link     pdl2DecimalInt      Integer
hi def link     pdl2HexadecimalInt  Integer
hi def link     pdl2OctalInt        Integer
hi def link     Integer             Number

" Floating point
syn match       pdl2Float           "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"
syn match       pdl2Float           "\<\.\d\+\([Ee][-+]\d\+\)\?\>"
syn match       pdl2Float           "\<\d\+[Ee][-+]\d\+\>"

hi def link     pdl2Float           Float


syn match       pdl2Global          "\$\w\+"
hi def link     pdl2Global          Function

syn keyword     pdl2Boolean         TRUE FALSE ON OFF
hi def link     pdl2Boolean         Function
