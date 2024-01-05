" File:       blow.vim
" Maintainer: Benjamin Block <benjamindblock@gmail.com>

scriptencoding utf-8

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="blow"

" ==========================
" Highlighting Function
" ==========================
fun! <sid>hi(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" ==========================
" Color Variables
" ==========================
let s:forestGreen1 = {'gui': '#011c1c'}
let s:forestGreen2 = {'gui': '#06312f'}
let s:forestGreen3 = {'gui': '#108D8A'}
let s:lightGreen = {'gui': '#74CC6C'}
let s:regularGreen = {'gui': '#00af5f'}
let s:brightBlue = {'gui': '#0004EF'}
let s:gray = {'gui': '#C6C6C6'}
let s:black = {'gui': '#1E0701'}
let s:black2 = {'gui': '#050505'}
let s:black3 = {'gui': '#D1CDCE'}
let s:white1 = {'gui': '#CFD2C2'}
let s:white2 = {'gui': '#D6BD99'}
let s:white3 = {'gui': '#EDF9F9'}
let s:white4 = {'gui': '#80CBC2'}
let s:white5 = {'gui': '#54C7B7'}
let s:white6 = {'gui': '#57575B'}
let s:white7 = {'gui': '#F2F2F2'}
let s:gold = {'gui': '#C69C0F'}
let s:brown = {'gui': '#5F5F00'}
let s:red = {'gui': '#D70000'}
let s:none = {'gui': 'NONE'}

" ==========================
" Definitions
" ==========================
" call <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE)
" Editor
call <sid>hi('ColorColumn', s:none, s:brightBlue, 'none')
call <sid>hi('Cursor', s:forestGreen1, s:white1, 'none')
call <sid>hi('CursorColumn', s:none, s:forestGreen2, 'none')
call <sid>hi('CursorLine', s:none, s:forestGreen2, 'none')
call <sid>hi('CursorLineNr', s:white1, s:forestGreen2, 'none')
call <sid>hi('Directory', s:white1, s:forestGreen1, 'none')
call <sid>hi('FoldColumn', s:gray, s:forestGreen1, 'none')
call <sid>hi('Folded', s:forestGreen3, s:none, 'none')
call <sid>hi('IncSearch', s:forestGreen1, s:gold, 'none')
call <sid>hi('LineNr', s:forestGreen3, s:forestGreen2, 'none')
call <sid>hi('MatchParen', s:white1, s:brightBlue, 'none')
call <sid>hi('Normal', s:white1, s:forestGreen1, 'none')
call <sid>hi('Pmenu', s:none, s:forestGreen2, 'none')
call <sid>hi('PmenuSel', s:none, s:brightBlue, 'none')
call <sid>hi('Search', s:white3, s:brightBlue, 'none')
call <sid>hi('SignColumn', s:none, s:forestGreen2, 'none')
call <sid>hi('StatusLine', s:black, s:white2, 'none')
call <sid>hi('StatusLineNC', s:white6, s:black3, 'none')
call <sid>hi('VertSplit', s:white7, s:white7, 'none')
call <sid>hi('Visual', s:none, s:brightBlue, 'none')

" General
call <sid>hi('Boolean', s:white4, s:none, 'none')
call <sid>hi('Character', s:white1, s:none, 'none')
call <sid>hi('Comment', s:lightGreen, s:none, 'none')
call <sid>hi('Conditional', s:white3, s:none, 'none')
call <sid>hi('Constant', s:white4, s:none, 'none')
call <sid>hi('Define', s:white1, s:none, 'none')
call <sid>hi('DiffAdd', s:forestGreen1, s:regularGreen, 'none')
call <sid>hi('DiffChange', s:forestGreen1, s:gold, 'none')
call <sid>hi('DiffDelete', s:white1, s:red, 'none')
call <sid>hi('DiffText', s:forestGreen1, s:brightBlue, 'none')
call <sid>hi('ErrorMsg', s:white1, s:red, 'none')
call <sid>hi('Float', s:white4, s:none, 'none')
call <sid>hi('Function', s:white1, s:none, 'none')
call <sid>hi('Identifier', s:white1, s:none, 'none')
call <sid>hi('Keyword', s:white3, s:none, 'none')
call <sid>hi('Label', s:white3, s:none, 'none')
call <sid>hi('NonText', s:lightGreen, s:none, 'none')
call <sid>hi('Number', s:white4, s:none, 'none')
call <sid>hi('Operator', s:white4, s:none, 'none')
call <sid>hi('PreProc', s:white1, s:none, 'none')
call <sid>hi('Special', s:white1, s:none, 'none')
call <sid>hi('SpecialKey', s:white1, s:none, 'none')
call <sid>hi('SpellBad', s:red, s:none, 'italic,undercurl')
call <sid>hi('SpellCap', s:white1, s:none, 'italic,undercurl')
call <sid>hi('SpellLocal', s:white1, s:none, 'undercurl')
call <sid>hi('Statement', s:white1, s:none, 'none')
call <sid>hi('StorageClass', s:white1, s:none, 'none')
call <sid>hi('String', s:white5, s:none, 'none')
call <sid>hi('Tag', s:white1, s:none, 'none')
call <sid>hi('Title', s:none, s:none, 'bold')
call <sid>hi('Todo', s:lightGreen, s:none, 'inverse,bold')
call <sid>hi('Type', s:none, s:none, 'none')
call <sid>hi('Underlined', s:none, s:none, 'underline')
call <sid>hi('WarningMsg', s:forestGreen1, s:gold, 'none')

call <sid>hi('TabLine', s:none, s:none, 'none')
call <sid>hi('TabLineSel', s:none, s:none, 'none')
call <sid>hi('TabLineFill', s:forestGreen1, s:gold, 'none')

" Diff Mode
if &diff
  call <sid>hi('DiffAdd', s:forestGreen1, s:regularGreen, 'none')
  call <sid>hi('DiffChange', s:forestGreen1, s:gold, 'none')
  call <sid>hi('DiffDelete', s:red, s:brown, 'none')
  call <sid>hi('DiffText', s:forestGreen1, s:brightBlue, 'none')
else
  call <sid>hi('DiffAdd', s:regularGreen, s:none, 'none')
  call <sid>hi('DiffChange', s:gold, s:none, 'none')
  call <sid>hi('DiffDelete', s:red, s:none, 'none')
  call <sid>hi('DiffText', s:forestGreen1, s:brightBlue, 'none')
endif

" ------------
" Plugins
" ------------

" todo.txt
call <sid>hi('TodoContext', s:white1, s:none, 'none')
call <sid>hi('TodoDate', s:white1, s:none, 'none')
call <sid>hi('TodoDone', s:lightGreen, s:none, 'none')
call <sid>hi('TodoPriorityA', s:white1, s:none, 'none')
call <sid>hi('TodoPriorityB', s:white1, s:none, 'none')
call <sid>hi('TodoPriorityC', s:white1, s:none, 'none')
call <sid>hi('TodoProject', s:white1, s:none, 'none')

" Buftabline
call <sid>hi('BufTabLineActive', s:white1, s:brightBlue, 'none')
call <sid>hi('BufTabLineCurrent', s:forestGreen1, s:black2, 'none')
call <sid>hi('BufTabLineFill', s:forestGreen1, s:forestGreen1, 'none')
call <sid>hi('BufTabLineHidden', s:lightGreen, s:forestGreen2, 'none')

" ALE
hi ALEError guifg         = #DDE1DE guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError
hi ALEErrorSign guifg     = #da3a2a guibg=NONE cterm=bold
hi! link ALEStyleErrorSign   ALEErrorSign
hi ALEWarningSign guifg   = #57bcc0 guibg=NONE cterm=bold
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

