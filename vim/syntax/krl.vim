" Vim syntax file
" Language: KRL
" Maintainer: Erik Jansson
" Latest Revision: 18 February 2015

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword     krlKeyword         ABORT ABOUT ACTIVATE ACTIVATES
syn keyword     krlKeyword         AFTER ALARM ALL
syn keyword     krlKeyword         ALONG AND ANY ANYERROR
syn keyword     krlKeyword         ARM ASSERT AT ATTACH
syn keyword     krlKeyword         AWAY BAS BEFORE BEGIN BREAK
syn keyword     krlKeyword         BY BYPASS CALL CALLS
syn keyword     krlKeyword         CANCEL CASE CATCH CLASS
syn keyword     krlKeyword         CLOSE CONDITION CONNECT CONST
syn keyword     krlKeyword         CONTINUE CURRENT CYCLE CYCLES
syn keyword     krlKeyword         DEACTIVATE DEACTIVATES DECODE DECL DEF DEFFCT DELAY
syn keyword     krlKeyword         DETACH DISABLE DISTANCE DIV
syn keyword     krlKeyword         DO DOWNTO DV_CNTRL ENABLE
syn keyword     krlKeyword         ENCODE END ENDCONDITION ENDFCT ENDFOR 
syn keyword     krlKeyword         ENDMOVE ENDOPEN ENDSELECT ENDTRY
syn keyword     krlKeyword         ENDWHILE ERRORCLASS ERRORNUM EVENT
syn keyword     krlKeyword         EXECS EXIT EXPORTED FILE
syn keyword     krlKeyword         FINAL FOR FROM GOTO
syn keyword     krlKeyword         GOTOS HAND HALT HOLD IMPORT
syn keyword     krlKeyword         IN INTERRUPT LOCK LONGJUMP
syn keyword     krlKeyword         MC MJ ML MOD
syn keyword     krlKeyword         MOVE MOVEFLY MV NEAR
syn keyword     krlKeyword         NL NODATA NODISABLE NOHOLD
syn keyword     krlKeyword         NOSAVE NOT NOTEACH OF
syn keyword     krlKeyword         OPEN OR OUT PATH PAUSE
syn keyword     krlKeyword         PAUSES PERCENT PLC POWERUP
syn keyword     krlKeyword         PRIORITY PROGRAM PROG_ARM PTP PULSE
syn keyword     krlKeyword         PURGE RAISE READ RELATIVE
syn keyword     krlKeyword         RELAX REPEAT RESUME RETRY
syn keyword     krlKeyword         RETURN ROL ROR ROUTINE
syn keyword     krlKeyword         SCAN SEC SEGMENT SELECT SETJUMP
syn keyword     krlKeyword         SHL SHR SIGNAL SKIP
syn keyword     krlKeyword         STACK START STEP STOP
syn keyword     krlKeyword         SYNCMOVE SYNCMOVEFLY TIL TIME
syn keyword     krlKeyword         TO TRY TYPE UAL
syn keyword     krlKeyword         UNLOCK UNPAUSE UNPAUSES UNTIL
syn keyword     krlKeyword         VAR VIA VOID WAIT
syn keyword     krlKeyword         WHEN WHILE WINDOW WITH
syn keyword     krlKeyword         WRITE XOR YELD

hi def link     krlKeyword         Keyword

" Conditional
syn keyword     krlConditional     IF THEN ELSE ENDIF
hi def link     krlConditional     Conditional

" Types
syn keyword     krlType            INT ARRAY BOOL JOINTPOS AXIS TORQLIMITPARAM KrlMsg_t KrlMsgPar_t KrlMsgOpt_t
syn keyword     krlType            POSITION REAL SEMAPHORE VECTOR VEC
syn keyword     krlType            XTNDPOS STRING RECORD ENDRECORD
syn keyword     krlType            ENDNODEDEF NODEDEF

hi def link     krlType            Type

" Comments
syn keyword     krlTodo            contained TODO FIXME XXX BUG
syn cluster     krlCommentGroup    contains=krlTodo
syn region      krlComment         start=";" end="$" contains=@krlCommentGroup,@Spell
hi def link     krlComment         Comment
hi def link     krlTodo            Todo


" Strings
syn region      krlString          start=+"+ end=+"+
syn region      krlUnicodeString   start=+'+ end=+'+

hi def link     krlString          String
hi def link     krlUnicodeString   String

" Numbers
syn match       krlDecimalInt      "\<\d\+\([Ee]\d\+\)\?\>"
syn match       krlHexadecimalInt  "\<0x\x\+\>"
syn match       krlOctalInt        "\<0\o\+\>"
syn match       krlOctalError      "\<0\o*[89]\d*\>"

hi def link     krlDecimalInt      Integer
hi def link     krlHexadecimalInt  Integer
hi def link     krlOctalInt        Integer
hi def link     Integer             Number

" Floating point
syn match       krlFloat           "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"
syn match       krlFloat           "\<\.\d\+\([Ee][-+]\d\+\)\?\>"
syn match       krlFloat           "\<\d\+[Ee][-+]\d\+\>"

hi def link     krlFloat           Float

" Boolean keywords
syn keyword		krlBoolean		ABS FALSE TRUE
hi def link		krlBoolean		Function

syn match		krlGlobal		"\$\w\+"

hi def link krlGlobal Function

