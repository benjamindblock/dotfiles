" Vim color file
" Author: Original theme "mono" by Phuc. Heavily modified by b3lm0nt.
" Colorscheme Name: smyck

highlight clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "smyck"

" ----------------------------------------------------------------------------
" Window Highlighting
" ----------------------------------------------------------------------------
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
hi MatchParen guifg       = #DDE1DE guibg=#C74545 cterm=bold
hi StatusLine guifg       = #DDE1DE guibg=#5f5f5f cterm=bold
hi StatusLineNC guifg     = darkgrey guibg=#5f5f5f cterm=NONE
hi Pmenu guifg            = NONE guibg=#5f5f5f cterm=NONE
hi PmenuSel guifg         = NONE guibg=#4e4e4e cterm=NONE
hi PmenuSbar guifg        = #4e4e4e guibg=#4e4e4e cterm=NONE
hi IncSearch guifg        = #303030 guibg=#ffd75f cterm=NONE
" hi Search guifg           = #e4e4e4 guibg=#5f87af cterm=bold
hi Search               cterm=bold ctermbg=6        ctermfg=15      gui=bold        guibg=#2EB5C1   guifg=#F7F7F7
" hi IncSearch            cterm=none ctermbg=3        ctermfg=8       gui=none        guibg=#F6DC69   guifg=#8F8F8F
hi Directory guifg        = #DDE1DE guibg=NONE cterm=NONE
hi Folded guifg           = #d7d7ff guibg=NONE cterm=NONE
hi Normal guifg           = #DDE1DE guibg=NONE cterm=NONE
hi Boolean guifg          = #DDE1DE guibg=NONE cterm=NONE
hi Character guifg        = #DDE1DE guibg=NONE cterm=NONE
hi Comment guifg          = darkgrey guibg=NONE cterm=NONE
hi Conditional guifg      = #DDE1DE guibg=NONE cterm=NONE
hi DiffAdd guifg          = #DDE1DE guibg=NONE cterm=bold
hi DiffDelete guifg       = #DDE1DE guibg=NONE cterm=NONE
hi DiffChange guifg       = #DDE1DE guibg=NONE cterm=NONE
hi DiffText guifg         = #DDE1DE guibg=NONE cterm=bold
hi ErrorMsg guifg         = #DDE1DE guibg=#5f5f5f cterm=NONE
hi WarningMsg guifg       = #DDE1DE guibg=#5f5f5f cterm=NONE
hi NonText guifg          = #DDE1DE guibg=NONE cterm=NONE
hi SpecialKey guifg       = #DDE1DE guibg=NONE cterm=NONE
hi Tag guifg              = #DDE1DE guibg=NONE cterm=NONE
hi Title guifg            = #DDE1DE guibg=NONE cterm=bold
hi Todo guifg             = #FFFFFF guibg=NONE cterm=bold
hi Directory guifg        = #d7d7ff guibg=NONE cterm=bold
hi MatchHTML guifg        = NONE guibg=#374E69 cterm=NONE

" ----------------------------------------------------------------------------
" Syntax Highlighting
" ----------------------------------------------------------------------------
hi Keyword              cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
hi Delimiter            cterm=none ctermbg=none ctermfg=15          gui=none        guifg=#F7F7F7
hi Identifier           cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#96D9F1
hi Structure            cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#9DEEF2
hi Ignore               cterm=none ctermbg=none ctermfg=8           gui=none        guifg=bg
hi Constant             cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#96D9F1
hi PreProc              cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
hi Type                 cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#96D9F1
hi Statement            cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
hi Special              cterm=none ctermbg=none ctermfg=6           gui=none        guifg=#d7d7d7
hi String               cterm=none ctermbg=none ctermfg=3           gui=none        guifg=#F6DC69
hi Number               cterm=none ctermbg=none ctermfg=3           gui=none        guifg=#F6DC69
hi Underlined           cterm=none ctermbg=none ctermfg=magenta     gui=underline   guibg=#272727
hi Symbol               cterm=none ctermbg=none ctermfg=9           gui=none        guifg=#FAB1AB
hi Method               cterm=none ctermbg=none ctermfg=15          gui=none        guifg=#F7F7F7
hi Interpolation        cterm=none ctermbg=none ctermfg=6           gui=none        guifg=#2EB5C1

" ----------------------------------------------------------------------------
" Ruby Syntax Highlighting
" ----------------------------------------------------------------------------
hi link rubyBeginend          Keyword
hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Method
hi link rubyIdentifier        Keyword
hi link rubyClassVariable     Symbol
hi link rubyInstanceVariable  Constant
hi link rubyGlobalVariable    Constant
hi link rubyClassVariable     Method
hi link rubyConstant          Constant
hi link rubySymbol            Symbol
hi link rubyFunction          Constant
hi link rubyControl           Keyword
hi link rubyConditional       Keyword
hi link rubyInterpolation     Interpolation
hi link rubyInterpolationDelimiter    Interpolation
hi link rubyRailsMethod       Method

" ----------------------------------------------------------------------------
" ALE Highlighting
" ----------------------------------------------------------------------------
hi ALEError guifg         = #DDE1DE guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError
hi ALEErrorSign guifg     = #FF1010 guibg=#4e4e4e cterm=bold
hi! link ALEStyleErrorSign   ALEErrorSign
hi ALEWarningSign guifg   = #00FFC5 guibg=#4e4e4e cterm=bold
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

hi TabLineFill guifg      = #DDE1DE guibg=NONE cterm=NONE
hi TabLine guifg          = #D2D4DE guibg=#5F5F5F cterm=NONE
hi TabLineSel guifg       = #151721 guibg=#ABABAB cterm=bold
