" ==========================================
" Vim syntax file
" Language:	C externtions
" Maintainer:	Wu Jie
" Last Change:	2007/10/12
" ==========================================

" ==========================================
" the extertion syntax define
" ==========================================
" EX_ENGINE extentions
syn keyword cType              SIZE_T
syn keyword cType              UINT INT UINT8 INT8 UINT16 INT16 UINT32 INT32 UINT64 INT64
syn keyword cType              uint uint8 int8 uint16 int16 uint32 int32 uint64 int64
syn keyword cType              FLOAT DOUBLE
syn keyword cType              f32 f64
syn keyword cType              CHAR WCHAR TCHAR TEXT
syn keyword cType              wchar tchar
syn keyword cType              INLINE NOINLINE
syn keyword cType              vec_f32_t
syn keyword cType              BOOL UBOOL
syn keyword cStatement         ex_malloc ex_malloc_use ex_malloc_nomanage
syn keyword cStatement         ex_realloc ex_realloc_use ex_realloc_nomanage
syn keyword cStatement         ex_free ex_free_use ex_free_nomanage
syn keyword cStatement         ex_stack_malloc
syn keyword cConstant	       TRUE FALSE

" ==========================================
" exMacroHighlight Predeined Syntax
" ==========================================

" the cPreCondit conflict with exMacroInside, use exPreCondit instead
syn region exMacroInside contained matchgroup=cPreProc start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\).*\/\/"rs=e-2 start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\).*" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" extend contains=@exEnableContainedGroup
syn match exPreCondit display "^\s*\(%:\|#\)\s*\(else\|elif\)\>.*" contains=cComment,cCommentL

" the bug is the exElseDisable and exIfxEnable share the same end.
syn region exElseDisable contained start="^\s*\(%:\|#\)\s*else\>" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" keepend contains=exCppSkip
syn region exElseEnable contained matchgroup=cPreProc start="^\s*\(%:\|#\)\s*else\>" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" keepend contains=@exEnableContainedGroup
syn region exCppSkip contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" extend contains=cSpaceError,exCppSkip

" add c enable group
syn cluster exEnableContainedGroup contains=cStatement,cLabel,cConditional,cRepeat,cString,cCppString,cCharacter,cSpecialError,cSpecialCharacter,cSpaceError,cBlock,cParen,cParenError,cBracket,cNumbers,cComment,cCommentL,cCommentError,cOperator,cType,cStructure,cStorageClass,cConstant,cCppOut,cInclude,cDefine,cPreProc,cMulti,cUserCont,cBitField
" add exMacroHighlight enable group
syn cluster exEnableContainedGroup add=exPreCondit,exMacroInside
syn cluster exEnableContainedGroup add=exIfDisableStart,exIfnDisableStart,exIfEnableStart,exIfnEnableStart
syn cluster exEnableContainedGroup add=exElifEnableStart,exElifnEnableStart,exElifDisableStart,exElifnDisableStart

" add to original c_syntax groups
" don't add exXXXStart in, or we will lose effect in Paren --> ( ... )
syn cluster cParenGroup add=exCppSkip,exMacroInside,exIfEnable,exIfDisable,exIfnEnable,exIfnDisable,exElifEnable,exElifnEnable,exElifDisable,exElifnDisable,exElseDisable,exElseEnable,exAndEnable,exAndnotEnable,exOrDisable,exOrnotDisable
syn cluster cPreProcGroup add=exCppSkip,exMacroInside,exIfEnable,exIfDisable,exIfnEnable,exIfnDisable,exElifEnable,exElifnEnable,exElifDisable,exElifnDisable,exElseDisable,exElseEnable,exAndEnable,exAndnotEnable,exOrDisable,exOrnotDisable
syn cluster cMultiGroup add=exCppSkip,exMacroInside,exIfEnable,exIfDisable,exIfnEnable,exIfnDisable,exElifEnable,exElifnEnable,exElifDisable,exElifnDisable,exElseDisable,exElseEnable,exAndEnable,exAndnotEnable,exOrDisable,exOrnotDisable 

" ==========================================
" Default highlighting
" ==========================================

" ------------------------------------------
" EX_ENGINE hilight defines
" ------------------------------------------
hi def link cType                 Type
hi def link cStatement            Statement
hi def link cConstant             Boolean

" ------------------------------------------
" exMacroHilight hilight defines
" ------------------------------------------
" inside pattern
hi def link exCppSkip              exMacroDisable
hi def link exMacroInside          Normal
hi def link exPreCondit            cPreProc

" else disable/enable
hi def link exElseDisable          exMacroDisable
hi def link exElseEnable           Normal

" logic 
hi def link exAndEnable            Normal
hi def link exAndnotEnable         Normal
hi def link exOrDisable            exMacroDisable
hi def link exOrnotDisable         exMacroDisable

" if/ifn eanble
hi def link exIfEnableStart        cPreProc
hi def link exIfEnable             Normal
hi def link exIfnEnableStart       cPreProc
hi def link exIfnEnable            Normal

" if/ifn disable
hi def link exIfDisable            exMacroDisable
hi def link exIfDisableStart       exMacroDisable
hi def link exIfnDisable           exMacroDisable
hi def link exIfnDisableStart      exMacroDisable

" elif/elifn enable
hi def link exElifEnableStart      cPreProc
hi def link exElifEnable           Normal
hi def link exElifnEnableStart     cPreProc
hi def link exElifnEnable          Normal

" elif/elifn disable
hi def link exElifDisableStart     exMacroDisable 
hi def link exElifDisable          exMacroDisable 
hi def link exElifnDisableStart    exMacroDisable 
hi def link exElifnDisable         exMacroDisable 

let b:current_syntax = "c"

" vim: ts=8