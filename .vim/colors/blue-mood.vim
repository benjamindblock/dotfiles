" Vim color file
" blue-mood
" Created by lmintmate with the help of ThemeCreator (https://github.com/mswift42/themecreator)

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
" :highlight

hi clear

if exists("syntax on")
syntax reset
endif

let g:colors_name = "blue-mood"


" Define reusable colorvariables.
let s:dodgerblue4="#104e8b"
let s:whitesmoke="#f5f5f5"
let s:fg2="#e1e1e1"
let s:fg3="#cecece"
let s:fg4="#bababa"
let s:bg2="#235c94"
let s:bg3="#366a9e"
let s:bg4="#4978a7"
let s:gold="#ffd700"
let s:wheat="#f5deb3"
let s:cyan= "#00ffff"
let s:gray72="#b8b8b8"
let s:chartreusegreen="#7fff00"
let s:tomato="#ff6347"
let s:cyan3="#00cdcd"
let s:red="#ff0000"
let s:warning2="#ff8800"
let s:yellow="#ffff00"
let s:ffb90f="#ffb90f"
let s:steelblue3="#4f94cd"
let s:black="#000000"
let s:bfbfbf="#bfbfbf"
let s:darkgray="#4d4d4d"
let s:lightgray="#cccccc"
let s:blue4="#00008b"
let s:goldenrod="#daa520"

exe 'hi Normal guifg='s:whitesmoke' guibg='s:dodgerblue4 
exe 'hi Cursor guifg='s:dodgerblue4' guibg='s:ffb90f 
exe 'hi CursorLine cterm=NONE guibg='s:bg2 
exe 'hi CursorColumn  guibg='s:bg2 
exe 'hi ColorColumn  guibg='s:bg2 
exe 'hi LineNr guifg='s:gray72' guibg='s:dodgerblue4 
exe 'hi CursorLineNr guifg='s:gray72' guibg='s:dodgerblue4' gui=NONE cterm=NONE' 
exe 'hi VertSplit guifg='s:dodgerblue4' guibg='s:gray72 
exe 'hi MatchParen guifg='s:whitesmoke'  guibg='s:steelblue3
exe 'hi StatusLine guifg='s:black' guibg='s:bfbfbf' gui=NONE cterm=NONE'
exe 'hi StatusLineNC guifg='s:lightgray' guibg='s:darkgray' gui=NONE cterm=NONE'
exe 'hi StatusLineTerm guifg='s:blue4' guibg='s:goldenrod' gui=NONE cterm=NONE'
exe 'hi StatusLineTermNC guifg='s:gray72' guibg='s:bg2
exe 'hi Pmenu guifg='s:whitesmoke' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi PmenuSbar  guibg='s:bg2 
exe 'hi PmenuThumb guibg='s:bg3
exe 'hi IncSearch guifg='s:black' guibg='s:bfbfbf
exe 'hi Search   guifg='s:black' guibg='s:bfbfbf
exe 'hi Visual guifg='s:yellow' guibg='s:red 
exe 'hi Directory guifg='s:cyan  
exe 'hi Folded guifg='s:gray72' guibg='s:dodgerblue4 
exe 'hi FoldColumn guifg='s:gray72' guibg='s:dodgerblue4 
exe 'hi ModeMsg guifg='s:whitesmoke
exe 'hi MoreMsg guifg='s:whitesmoke' cterm=NONE'
exe 'hi Question guifg='s:whitesmoke
exe 'hi WildMenu guifg='s:red' guibg='s:yellow' gui=NONE cterm=NONE'
exe 'hi TabLine      guifg='s:bfbfbf' guibg='s:black' gui=reverse cterm=reverse'
exe 'hi TabLineFill  guifg='s:bfbfbf' guibg='s:lightgray
exe 'hi TabLineSel   guifg='s:black' guibg='s:bfbfbf' gui=NONE'
exe 'hi SignColumn guibg='s:dodgerblue4
exe 'hi SpellCap guisp='s:gold

exe 'hi Boolean guifg='s:cyan3' gui=NONE cterm=NONE'  
exe 'hi Character guifg='s:cyan  
exe 'hi Comment guifg='s:gray72' gui=NONE cterm=NONE' 
exe 'hi Conditional guifg='s:gold  
exe 'hi Constant guifg='s:cyan 
exe 'hi Debug guifg='s:whitesmoke 
exe 'hi Define guifg='s:gold 
exe 'hi Delimiter guifg='s:whitesmoke 
exe 'hi ErrorMsg guifg='s:whitesmoke' guibg='s:red' gui=NONE cterm=NONE'
exe 'hi WarningMsg guifg='s:gold' gui=NONE cterm=NONE' 
exe 'hi Exception guifg='s:gold
exe 'hi Float guifg='s:cyan  
exe 'hi Function guifg='s:chartreusegreen' gui=NONE cterm=NONE'  
exe 'hi Identifier guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi Keyword guifg='s:gold'  gui=NONE cterm=NONE'
exe 'hi Label guifg='s:cyan3
exe 'hi Macro guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi NonText guifg='s:steelblue3' guibg='s:dodgerblue4 
exe 'hi EndOfBuffer guifg='s:steelblue3' guibg='s:dodgerblue4 
exe 'hi Number guifg='s:cyan  
exe 'hi Operator guifg='s:gold  
exe 'hi PreProc guifg='s:gold
exe 'hi PreCondit guifg='s:gold
exe 'hi Include guifg='s:gold
exe 'hi Repeat guifg='s:gold  
exe 'hi Special guifg='s:whitesmoke 
exe 'hi SpecialChar guifg='s:whitesmoke 
exe 'hi SpecialComment guifg='s:gray72' gui=NONE cterm=NONE'
exe 'hi SpecialKey guifg='s:steelblue3' guibg='s:dodgerblue4 
exe 'hi Statement guifg='s:gold  
exe 'hi StorageClass guifg='s:chartreusegreen
exe 'hi String guifg='s:lightgray 
exe 'hi Structure guifg='s:chartreusegreen 
exe 'hi Tag guifg='s:gold  
exe 'hi Title guifg='s:chartreusegreen'  gui=NONE cterm=NONE'
exe 'hi Todo guifg='s:wheat'  guibg='s:dodgerblue4' gui=NONE cterm=NONE'
exe 'hi Type guifg='s:chartreusegreen 
exe 'hi Typedef guifg='s:chartreusegreen
exe 'hi Underlined   gui=underline'

exe 'hi DiffAdd guifg='s:chartreusegreen' guibg='s:dodgerblue4' gui=NONE cterm=NONE'
exe 'hi DiffDelete guifg='s:tomato' guibg='s:dodgerblue4' gui=NONE cterm=NONE'
exe 'hi DiffChange guifg='s:whitesmoke' guibg='s:cyan3 
exe 'hi DiffText guifg='s:whitesmoke' guibg='s:steelblue3' gui=NONE cterm=NONE'

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:wheat
exe 'hi rubyLocalVariableOrMethod guifg='s:cyan3
exe 'hi rubyGlobalVariable guifg='s:cyan3
exe 'hi rubyInstanceVariable guifg='s:cyan3
exe 'hi rubyKeyword guifg='s:gold
exe 'hi rubyKeywordAsMethod guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi rubyClassDeclaration guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi rubyClass guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi rubyNumber guifg='s:cyan

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:wheat

" Go Highlighting
exe 'hi goBuiltins guifg='s:wheat

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:wheat
exe 'hi jsFunction guifg='s:gold' gui=NONE cterm=NONE'
exe 'hi jsGlobalObjects guifg='s:chartreusegreen
exe 'hi jsAssignmentExps guifg='s:cyan3

" Html Highlighting
exe 'hi htmlLink guifg='s:cyan' gui=underline'
exe 'hi htmlStatement guifg='s:gold
exe 'hi htmlSpecialTagName guifg='s:gold

" Markdown Highlighting
exe 'hi mkdCode guifg='s:wheat

" ALE Errors
hi ALEError guifg         = #FF0000 guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi ALEErrorSign guifg     = #FF0000 guibg=NONE cterm=NONE
hi! link ALEStyleErrorSign   ALEErrorSign

" ALE Warnings
hi ALEWarning guifg         = NONE guibg=NONE cterm=underline
hi! link ALEStyleWarning     ALEWarning
hi! link ALEInfo             ALEWarning
hi ALEWarningSign guifg   = #FF8B00 guibg=NONE cterm=NONE
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

