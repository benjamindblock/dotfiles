" Vim color file
" Author: Original theme "mono" by Phuc. Heavily modified by b3lm0nt.
" Colorscheme Name: bdb

highlight clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bdb"

" Default group
hi Cursor guifg           = #303030 guibg=#FFFFFF cterm=NONE
hi Visual guifg           = NONE guibg=#5f5f5f cterm=NONE
hi CursorLine guifg       = NONE guibg=#24292F cterm=NONE
hi CursorColumn guifg     = darkgrey guibg=#5f5f5f cterm=NONE
hi ColorColumn guifg      = NONE guibg=#4e4e4e cterm=NONE
hi LineNr guifg           = grey guibg=#4e4e4e cterm=NONE
hi CursorLineNr guifg     = #ffd75f guibg=#4e4e4e cterm=bold
hi SignColumn guifg       = grey guibg=#4e4e4e cterm=NONE
hi Error guifg            = grey guibg=#4e4e4e cterm=NONE
hi DiagnosticError  guifg = #000000 guibg=#4e4e4e guifg=NONE
hi DiagnosticWarn  guifg  = #808000 guibg=#4e4e4e guifg=NONE
hi DiagnosticInfo  guifg  = grey guibg=#4e4e4e guifg=NONE
hi VertSplit guifg        = #4e4e4e  guibg=NONE cterm=NONE
hi MatchParen guifg       = #EFEDE3 guibg=#C74545 cterm=bold
hi StatusLine guifg       = #EFEDE3 guibg=#5f5f5f cterm=bold
hi StatusLineNC guifg     = darkgrey guibg=#5f5f5f cterm=NONE
hi Pmenu guifg            = NONE guibg=#5f5f5f cterm=NONE
hi PmenuSel guifg         = NONE guibg=#4e4e4e cterm=NONE
hi PmenuSbar guifg        = #4e4e4e guibg=#4e4e4e cterm=NONE
hi IncSearch guifg        = #303030 guibg=#ffd75f cterm=NONE
hi Search guifg           = #e4e4e4 guibg=#5f87af cterm=bold
hi Directory guifg        = #EFEDE3 guibg=NONE cterm=NONE
hi Folded guifg           = #d7d7ff guibg=NONE cterm=NONE
hi Normal guifg           = #EFEDE3 guibg=NONE cterm=NONE
hi Boolean guifg          = #EFEDE3 guibg=NONE cterm=NONE
hi Character guifg        = #EFEDE3 guibg=NONE cterm=NONE
hi Comment guifg          = darkgrey guibg=NONE cterm=NONE
hi Conditional guifg      = #EFEDE3 guibg=NONE cterm=NONE
hi Constant guifg         = #EFEDE3 guibg=NONE cterm=NONE
hi Define guifg           = #EFEDE3 guibg=NONE cterm=NONE
hi DiffAdd guifg          = #EFEDE3 guibg=NONE cterm=bold
hi DiffDelete guifg       = #EFEDE3 guibg=NONE cterm=NONE
hi DiffChange guifg       = #EFEDE3 guibg=NONE cterm=NONE
hi DiffText guifg         = #EFEDE3 guibg=NONE cterm=bold
hi ErrorMsg guifg         = #EFEDE3 guibg=#5f5f5f cterm=NONE
hi WarningMsg guifg       = #EFEDE3 guibg=#5f5f5f cterm=NONE
hi Float guifg            = #EFEDE3 guibg=NONE cterm=NONE
hi Function guifg         = #EFEDE3 guibg=NONE cterm=NONE
hi Identifier guifg       = #EFEDE3 guibg=NONE cterm=NONE
hi Keyword guifg          = #EFEDE3 guibg=NONE cterm=NONE
hi Label guifg            = #EFEDE3 guibg=NONE cterm=NONE
hi NonText guifg          = #EFEDE3 guibg=NONE cterm=NONE
hi Number guifg           = #EFEDE3 guibg=NONE cterm=NONE
hi Special guifg          = #EFEDE3 guibg=NONE cterm=NONE
hi Operator guifg         = #EFEDE3 guibg=NONE cterm=NONE
hi PreProc guifg          = #EFEDE3 guibg=NONE cterm=NONE
hi SpecialKey guifg       = #EFEDE3 guibg=NONE cterm=NONE
hi Statement guifg        = #EFEDE3 guibg=NONE cterm=NONE
hi StorageClass guifg     = #EFEDE3 guibg=NONE cterm=NONE
hi String guifg           = darkgrey guibg=NONE cterm=NONE
hi rubySymbol guifg       = darkgrey guibg=NONE cterm=NONE
hi Tag guifg              = #EFEDE3 guibg=NONE cterm=NONE
hi Title guifg            = #EFEDE3 guibg=NONE cterm=bold
hi Todo guifg             = #FFFFFF guibg=NONE cterm=bold
hi Type guifg             = #EFEDE3 guibg=NONE cterm=NONE
hi Underlined guifg       = #EFEDE3 guibg=NONE cterm=underline
hi Directory guifg        = #d7d7ff guibg=NONE cterm=bold
hi MatchHTML guifg        = NONE    guibg=#4C4C4C cterm=NONE

hi ALEError guifg         = #EFEDE3 guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError
hi ALEErrorSign guifg     = #FF1010 guibg=#4e4e4e cterm=bold
hi! link ALEStyleErrorSign   ALEErrorSign
hi ALEWarningSign guifg   = #00FFC5 guibg=#4e4e4e cterm=bold
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

hi TabLineFill guifg      = #EFEDE3 guibg=NONE cterm=NONE
hi TabLine guifg          = #D2D4DE guibg=#5F5F5F cterm=NONE
hi TabLineSel guifg       = #151721 guibg=#ABABAB cterm=bold
