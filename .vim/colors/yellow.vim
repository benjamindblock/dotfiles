" Vim color file
" Author: Original theme "mono" by Phuc. Heavily modified by b3lm0nt.
" Colorscheme Name: yellow

highlight clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "yellow"

" Default group
hi Normal guifg           = #fce94e guibg=NONE cterm=NONE
hi Cursor guifg           = #303030 guibg=#FFFFFF cterm=NONE
hi Visual guifg           = NONE guibg=#5f5f5f cterm=NONE
hi CursorLine guifg       = NONE guibg=#444444 cterm=NONE
hi CursorLineNr guifg     = #fce94e guibg=#444444 cterm=NONE
hi CursorColumn guifg     = #bdb04a guibg=#5f5f5f cterm=NONE
hi ColorColumn guifg      = NONE guibg=#4e4e4e cterm=NONE
hi LineNr guifg           = #bdb04e guibg=#000000 cterm=NONE
hi SignColumn guifg       = grey guibg=#4e4e4e cterm=NONE
hi Error guifg            = grey guibg=#4e4e4e cterm=NONE
hi DiagnosticError  guifg = #000000 guibg=#4e4e4e guifg=NONE
hi DiagnosticWarn  guifg  = #808000 guibg=#4e4e4e guifg=NONE
hi DiagnosticInfo  guifg  = grey guibg=#4e4e4e guifg=NONE
hi VertSplit guifg        = #4e4e4e  guibg=NONE cterm=NONE
hi MatchParen guifg       = #fce94e guibg=#C74545 cterm=NONE
hi StatusLine guifg       = #000000 guibg=#fce94e cterm=NONE
hi StatusLineNC guifg     = #bdb04a guibg=#222222 cterm=NONE
hi Pmenu guifg            = NONE guibg=#5f5f5f cterm=NONE
hi PmenuSel guifg         = NONE guibg=#4e4e4e cterm=NONE
hi PmenuSbar guifg        = #4e4e4e guibg=#4e4e4e cterm=NONE
hi IncSearch guifg        = #000000 guibg=#fce94e cterm=NONE
hi Search guifg           = #fce94e guibg=#5c5cff cterm=NONE
hi Folded guifg           = #d7d7ff guibg=NONE cterm=NONE
hi Boolean guifg          = #fce94e guibg=NONE cterm=NONE
hi Character guifg        = #fce94e guibg=NONE cterm=NONE
hi Comment guifg          = #00ffff guibg=NONE cterm=NONE
hi Conditional guifg      = #fce94e guibg=NONE cterm=NONE
hi Constant guifg         = #fce94e guibg=NONE cterm=NONE
hi Define guifg           = #fce94e guibg=NONE cterm=NONE
hi DiffAdd guifg          = #fce94e guibg=NONE cterm=NONE
hi DiffDelete guifg       = #fce94e guibg=NONE cterm=NONE
hi DiffChange guifg       = #fce94e guibg=NONE cterm=NONE
hi DiffText guifg         = #fce94e guibg=NONE cterm=NONE
hi ErrorMsg guifg         = #fce94e guibg=#5f5f5f cterm=NONE
hi WarningMsg guifg       = #fce94e guibg=#5f5f5f cterm=NONE
hi Float guifg            = #fce94e guibg=NONE cterm=NONE
hi Function guifg         = #fce94e guibg=NONE cterm=NONE
hi Identifier guifg       = #fce94e guibg=NONE cterm=NONE
hi Keyword guifg          = #fce94e guibg=NONE cterm=NONE
hi Label guifg            = #fce94e guibg=NONE cterm=NONE
hi NonText guifg          = #fce94e guibg=NONE cterm=NONE
hi Number guifg           = #fce94e guibg=NONE cterm=NONE
hi Special guifg          = #fce94e guibg=NONE cterm=NONE
hi Operator guifg         = #fce94e guibg=NONE cterm=NONE
hi PreProc guifg          = #fce94e guibg=NONE cterm=NONE
hi SpecialKey guifg       = #fce94e guibg=NONE cterm=NONE
hi Statement guifg        = #fce94e guibg=NONE cterm=NONE
hi StorageClass guifg     = #fce94e guibg=NONE cterm=NONE
hi String guifg           = #bdb04a guibg=NONE cterm=NONE
hi rubySymbol guifg       = #bdb04a guibg=NONE cterm=NONE
hi Tag guifg              = #fce94e guibg=NONE cterm=NONE
hi Title guifg            = #fce94e guibg=NONE cterm=NONE
hi Todo guifg             = #FFFFFF guibg=NONE cterm=NONE
hi Type guifg             = #fce94e guibg=NONE cterm=NONE
hi Underlined guifg       = #fce94e guibg=NONE cterm=underline
hi Directory guifg        = #5c5cff guibg=NONE cterm=NONE
hi MatchHTML guifg        = NONE    guibg=#cd00cd cterm=NONE
hi MatchParen guifg       = NONE    guibg=#cd00cd cterm=NONE
hi netrwSymLink guifg     = #3bb853 guibg=NONE cterm=NONE

" ALE
hi ALEError guifg         = #fce94e guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError
hi ALEErrorSign guifg     = #da3a2a guibg=#4e4e4e cterm=NONE
hi! link ALEStyleErrorSign   ALEErrorSign
hi ALEWarningSign guifg   = #57bcc0 guibg=#4e4e4e cterm=NONE
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

hi TabLineFill guifg      = #fce94e guibg=NONE cterm=NONE
hi TabLine guifg          = #D2D4DE guibg=#5F5F5F cterm=NONE
hi TabLineSel guifg       = #151721 guibg=#ABABAB cterm=NONE
