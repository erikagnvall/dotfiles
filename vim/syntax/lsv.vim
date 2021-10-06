" Vim syntax file
" Language: LSV (Variable files for PDL2)
" Maintainer: Erik Jansson

if exists("b:current_syntax")
  finish
endif

syn keyword     lsvKeyword         TYPE
syn keyword     lsvKeyword         Glob Priv Fields Len
syn keyword     lsvKeyword         Ax Arm

hi def link     lsvKeyword         Keyword

" Types
syn keyword     lsvType            INT AREA BOO JNTP
syn keyword     lsvType            POSITION REA SEMAPHORE VECTOR VEC
syn keyword     lsvType            XTNDPOS STRING STR RECORD REC ENDRECORD
syn keyword     lsvType            ENDNODEDEF NODEDEF

hi def link     lsvType            Type

" Comments
syn keyword     lsvTodo            contained TODO FIXME XXX BUG
syn cluster     lsvCommentGroup    contains=lsvTodo
syn region      lsvComment         start="--" end="$" contains=@lsvCommentGroup,@Spell
hi def link     lsvComment         Comment
hi def link     lsvTodo            Todo

" Strings
syn region      lsvString          start=+"+ end=+"+
syn region      lsvUnicodeString   start=+'+ end=+'+

hi def link     lsvString          String
hi def link     lsvUnicodeString   String

" Numbers
syn match       lsvDecimalInt      "\<\d\+\([Ee]\d\+\)\?\>"
syn match       lsvHexadecimalInt  "\<0x\x\+\>"
syn match       lsvOctalInt        "\<0\o\+\>"
syn match       lsvOctalError      "\<0\o*[89]\d*\>"

hi def link     lsvDecimalInt      Integer
hi def link     lsvHexadecimalInt  Integer
hi def link     lsvOctalInt        Integer
hi def link     Integer             Number

" Floating point
syn match       lsvFloat           "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"
syn match       lsvFloat           "\<\.\d\+\([Ee][-+]\d\+\)\?\>"
syn match       lsvFloat           "\<\d\+[Ee][-+]\d\+\>"

hi def link     lsvFloat           Float

" Boolean
syn keyword     lsvBoolean         TRUE FALSE ON OFF
hi def link     lsvBoolean         Boolean
