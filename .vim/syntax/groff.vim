" VIM syntax file
" Language:	groff
" Maintainer:	Alejandro López-Valencia <dradul@yahoo.com>
" URL:		http://dradul.tripod.com/vim
" Last Change:	2023 Apr 27 by BB. Make all logic groff.
"
" {{{1 Acknowledgements
"
" ACKNOWLEDGEMENTS:
"
" My thanks to Jérôme Plût <Jerome.Plut@ens.fr>, who was the
" creator and maintainer of this syntax file for several years.
" May I be as good at it as he has been.
"
" {{{1 Todo
"
" TODO:
"
" * Write syntax highlighting files for the preprocessors,
"	and integrate with nroff.vim.
"
"
" {{{1 Start syntax highlighting.
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

"
" {{{1 plugin settings...
"
" {{{2 enable spacing error highlighting
"
if exists("nroff_space_errors")
	syn match nroffError /\s\+$/
	syn match nroffSpaceError /[.,:;!?]\s\{2,}/
endif
"
"
" {{{1 Special file settings
"
" {{{2  ms exdented paragraphs are not in the default paragraphs list.
"
setlocal paragraphs+=XP
"
" {{{2 Activate navigation to preporcessor sections.
"
if exists("b:preprocs_as_sections")
	setlocal sections=EQTSPS[\ G1GS
endif

" {{{1 Escape sequences
" ------------------------------------------------------------

syn match nroffEscChar /\\[CN]/ nextgroup=nroffEscCharArg
syn match nroffEscape /\\[*fgmnYV]/ nextgroup=nroffEscRegPar,nroffEscRegArg
syn match nroffEscape /\\s[+-]\=/ nextgroup=nroffSize
syn match nroffEscape /\\[$AbDhlLRvxXZ]/ nextgroup=nroffEscPar,nroffEscArg

syn match nroffEscRegArg /./ contained
syn match nroffEscRegArg2 /../ contained
syn match nroffEscRegPar /(/ contained nextgroup=nroffEscRegArg2
syn match nroffEscArg /./ contained
syn match nroffEscArg2 /../ contained
syn match nroffEscPar /(/ contained nextgroup=nroffEscArg2
syn match nroffSize /\((\d\)\=\d/ contained

syn region nroffEscCharArg start=/'/ end=/'/ contained
syn region nroffEscArg start=/'/ end=/'/ contained contains=nroffEscape,@nroffSpecial

syn region nroffEscRegArg matchgroup=nroffEscape start=/\[/ end=/\]/ contained oneline
syn region nroffSize matchgroup=nroffEscape start=/\[/ end=/\]/ contained

syn match nroffEscape /\\[adprtu{}]/
syn match nroffEscape /\\$/
syn match nroffEscape /\\\$[@*]/

" {{{1 Strings and special characters
" ------------------------------------------------------------

syn match nroffSpecialChar /\\[\\eE?!-]/
syn match nroffSpace "\\[&%~|^0)/,]"
syn match nroffSpecialChar /\\(../

syn match nroffSpecialChar /\\\[[^]]*]/
syn region nroffPreserve  matchgroup=nroffSpecialChar start=/\\?/ end=/\\?/ oneline

syn region nroffPreserve matchgroup=nroffSpecialChar start=/\\!/ end=/$/ oneline

syn cluster nroffSpecial contains=nroffSpecialChar,nroffSpace


syn region nroffString start=/"/ end=/"/ skip=/\\$/ contains=nroffEscape,@nroffSpecial contained
syn region nroffString start=/'/ end=/'/ skip=/\\$/ contains=nroffEscape,@nroffSpecial contained


" {{{1 Numbers and units
" ------------------------------------------------------------
syn match nroffNumBlock /[0-9.]\a\=/ contained contains=nroffNumber
syn match nroffNumber /\d\+\(\.\d*\)\=/ contained nextgroup=nroffUnit,nroffBadChar
syn match nroffNumber /\.\d\+)/ contained nextgroup=nroffUnit,nroffBadChar
syn match nroffBadChar /./ contained
syn match nroffUnit /[icpPszmnvMu]/ contained


" {{{1 Requests
" ------------------------------------------------------------

" Requests begin with . or ' at the beginning of a line, or
" after .if or .ie.

syn match nroffReqLeader /^[.']/	nextgroup=nroffReqName skipwhite
syn match nroffReqLeader /[.']/	contained nextgroup=nroffReqName skipwhite

"
" GNU troff allows long request names
"
syn match nroffReqName /[^\t \\\[?]\+/ contained nextgroup=nroffReqArg

syn region nroffReqArg start=/\S/ skip=/\\$/ end=/$/ contained contains=nroffEscape,@nroffSpecial,nroffString,nroffError,nroffSpaceError,nroffNumBlock,nroffComment

" {{{2 Conditional: .if .ie .el
syn match nroffReqName /\(if\|ie\)/ contained nextgroup=nroffCond skipwhite
syn match nroffReqName /el/ contained nextgroup=nroffReqLeader skipwhite
syn match nroffCond /\S\+/ contained nextgroup=nroffReqLeader skipwhite

" {{{2 String definition: .ds .as
syn match nroffReqname /[da]s/ contained nextgroup=nroffDefIdent skipwhite
syn match nroffDefIdent /\S\+/ contained nextgroup=nroffDefinition skipwhite
syn region nroffDefinition matchgroup=nroffSpecialChar start=/"/ matchgroup=NONE end=/\\"/me=e-2 skip=/\\$/ start=/\S/ end=/$/ contained contains=nroffDefSpecial
syn match nroffDefSpecial /\\$/ contained
syn match nroffDefSpecial /\\\((.\)\=./ contained

syn match nroffDefSpecial /\\\[[^]]*]/ contained

" {{{2 Macro definition: .de .am, also diversion: .di
syn match nroffReqName /\(d[ei]\|am\)/ contained nextgroup=nroffIdent skipwhite
syn match nroffIdent /[^[?( \t]\+/ contained
syn match nroffReqName /als/ contained nextgroup=nroffIdent skipwhite

" {{{2 Register definition: .rn .rr
syn match nroffReqName /[rn]r/ contained nextgroup=nroffIdent skipwhite
syn match nroffReqName /\(rnn\|aln\)/ contained nextgroup=nroffIdent skipwhite


" {{{1 eqn/tbl/pic
" ------------------------------------------------------------
" <jp>
" XXX: write proper syntax highlight for eqn / tbl / pic ?
" <jp />

syn region nroffEquation start=/^\.\s*EQ\>/ end=/^\.\s*EN\>/
syn region nroffTable start=/^\.\s*TS\>/ end=/^\.\s*TE\>/
syn region nroffPicture start=/^\.\s*PS\>/ end=/^\.\s*PE\>/
syn region nroffRefer start=/^\.\s*\[\>/ end=/^\.\s*\]\>/
syn region nroffGrap start=/^\.\s*G1\>/ end=/^\.\s*G2\>/
syn region nroffGremlin start=/^\.\s*GS\>/ end=/^\.\s*GE|GF\>/

" {{{1 Comments
" ------------------------------------------------------------

syn region nroffIgnore start=/^[.']\s*ig/ end=/^['.]\s*\./
syn match nroffComment /\(^[.']\s*\)\=\\".*/ contains=nroffTodo
syn match nroffComment /^'''.*/  contains=nroffTodo

syn match nroffComment "\\#.*$" contains=nroffTodo

syn keyword nroffTodo TODO XXX FIXME contained

" {{{1 Hilighting
" ------------------------------------------------------------
"

"
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
"
if version >= 508 || !exists("did_nroff_syn_inits")

	if version < 508
		let did_nroff_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink nroffEscChar nroffSpecialChar
	HiLink nroffEscCharAr nroffSpecialChar
	HiLink nroffSpecialChar SpecialChar
	HiLink nroffSpace Delimiter

	HiLink nroffEscRegArg2 nroffEscRegArg
	HiLink nroffEscRegArg nroffIdent

	HiLink nroffEscArg2 nroffEscArg
	HiLink nroffEscPar nroffEscape

	HiLink nroffEscRegPar nroffEscape
	HiLink nroffEscArg nroffEscape
	HiLink nroffSize nroffEscape
	HiLink nroffEscape Preproc

	HiLink nroffIgnore Comment
	HiLink nroffComment Comment
	HiLink nroffTodo Todo

	HiLink nroffReqLeader nroffRequest
	HiLink nroffReqName nroffRequest
	HiLink nroffRequest Statement
	HiLink nroffCond PreCondit
	HiLink nroffDefIdent nroffIdent
	HiLink nroffIdent Identifier

	HiLink nroffEquation PreProc
	HiLink nroffTable PreProc
	HiLink nroffPicture PreProc
	HiLink nroffRefer PreProc
	HiLink nroffGrap PreProc
	HiLink nroffGremlin PreProc

	HiLink nroffNumber Number
	HiLink nroffBadChar nroffError
	HiLink nroffSpaceError nroffError
	HiLink nroffError Error

	HiLink nroffPreserve String
	HiLink nroffString String
	HiLink nroffDefinition String
	HiLink nroffDefSpecial Special

	delcommand HiLink

endif

let b:current_syntax = "nroff"

" vim600: set fdm=marker fdl=2:
