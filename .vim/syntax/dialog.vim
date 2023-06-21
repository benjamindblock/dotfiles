" Vim syntax file
" Language:    DIALOG
" Maintainer:  Ptolom ptolom@hexifact.co.uk
" Last Change: 2022 Oct 18

" quit if a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn match dialogComment  /%%.*/ contains=@Spell
syn match dialogVariable /\\\@<!$[A-Za-z_+\-]*/
syn match dialogDictionaryWord /\\\@<!@[A-Za-z_+\-]\+\|@\\[nbsudlr]/
syn match dialogObject /\\\@<!#[A-Za-z_+\-]\+/
syn match dialogTopic /\\\@<!\*/ contained containedin=dialogPredicate
syn match dialogNumber /[1-9][0-9]*/ 

syn match dialogPredicate /(\@<=.*\ze)/ contains=ALLBUT,dialogPredicate contains=@NoSpell

syn match dialogSpecial /(\@<=\(or\|then\|if\|then\|elseif\|else\|endif\)\ze)/
syn match dialogSpecial /(\@<=\(select\|stopping\|cycling\)\ze)/
syn match dialogSpecial /(\@<=\(then \)\?\(purely \)\?at random\ze)/
syn match dialogSpecial /(\@<=exhaust\ze)/
syn match dialogSpecial /(\@<=collect\ze  \$.\{-1,})/
syn match dialogSpecial /(\@<=collect\ze  .\{-1,})/
syn match dialogSpecial /(\@<=into\ze  \$.\{-1,})/
syn match dialogSpecial /(\@<=accumulate\ze  \$.\{-1,})/
syn match dialogSpecial /(\@<=determine object\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=from words\ze .\{-1,})/
syn match dialogSpecial /(\@<=matching all of\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=stoppable\ze)/
syn match dialogSpecial /(\@<=span\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=div\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=\(inline \)\?status bar\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=link\ze)/
syn match dialogSpecial /(\@<=link\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=link resource\ze \$.\{-1,})/
syn match dialogSpecial /(\@<=log\ze)/
syn match dialogSpecial /(\@<=now\ze)/
syn match dialogSpecial /(\@<=just\ze)/
syn match dialogSpecial /(\@<=global variable\ze (.*))/
syn match dialogSpecial /(\@<=interface\ze (.*))/
syn match dialogSpecial /(\@<=generate\ze .\+ (.*))/
syn match dialogSpecial /@\ze(.*)/
syn match dialogSpecial /\~\ze(.*)/

hi def link dialogComment        Comment
hi def link dialogPredicate      Statement
hi def link dialogDictionaryWord String
hi def link dialogObject         Constant
hi def link dialogTopic          Constant
hi def link dialogNumber         Number
hi def link dialogVariable       Identifier
hi def link dialogSpecial        Special

let b:current_syntax = "dialog"

" vim: ts=2
