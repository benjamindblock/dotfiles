highlight clear 

" for cterm, 'black' might get overwritten by the terminal emulator, so we use
" 232 (#080808), which is close enough.

highlight! Normal guibg=#ffffea guifg=#000000 ctermbg=230 ctermfg=232 
highlight! NonText guibg=bg guifg=#ffffea ctermbg=bg ctermfg=230
highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=bold ctermbg=159 ctermfg=232 cterm=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE
highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
highlight! VertSplit guibg=#ffffea guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! Folded guibg=#cccc7c guifg=fg gui=NONE ctermbg=187 ctermfg=fg cterm=NONE
highlight! FoldColumn guibg=#fcfcce guifg=fg ctermbg=229 ctermfg=fg
highlight! Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! LineNr guibg=#eaebdb guifg=#6e6e6e gui=NONE ctermbg=bg ctermfg=239 cterm=NONE
highlight! CursorLineNr guibg=#eaebdb guifg=#000000 gui=bold ctermbg=bg ctermfg=239 cterm=bold
highlight! Visual guibg=#eeee9d guifg=#000000 ctermbg=fg ctermfg=bg
highlight! CursorLine guibg=#eaebdb guifg=NONE ctermbg=230 ctermfg=fg cterm=NONE
highlight! Pmenu guibg=bg guifg=fg ctermbg=bg ctermfg=fg
highlight! PmenuSel guibg=fg guifg=bg ctermbg=fg ctermfg=bg
highlight! TabLine guifg=#000000 guibg=#eaebdb gui=NONE cterm=NONE
highlight! TabLineFill guifg=#000000 guibg=#eaebdb gui=NONE cterm=NONE
highlight! TabLineSel guifg=#000000 guibg=#c9cabc gui=bold cterm=bold

highlight! Statement guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! Identifier guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! Type guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! PreProc guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! rubyControl guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! Constant guibg=bg guifg=#101010 gui=NONE ctermbg=bg ctermfg=233 cterm=NONE
highlight! Comment guibg=bg guifg=#6e6e6e gui=NONE ctermbg=bg ctermfg=236 cterm=NONE
highlight! String guibg=bg guifg=#6e6e6e gui=NONE ctermbg=bg ctermfg=236 cterm=NONE
highlight! Special guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! SpecialKey guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! NonText guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! Directory guibg=bg guifg=#0d40c9 gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! link Title Directory
highlight! link MoreMsg Comment
highlight! link Question Comment
hi MatchHTML guifg=NONE guibg=#eaebdb cterm=NONE

" Vim
hi link vimFunction Identifier

" Search
highlight! Search guibg=#aeeeee guifg=#000000 gui=bold cterm=bold,underline
highlight! IncSearch guibg=#aeeeee guifg=#000000 gui=bold cterm=bold,underline

hi ALEError guifg         = #000000 guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError

hi ALEErrorSign guifg     = #F60000 guibg=#eaebdb cterm=bold
hi! link ALEStyleErrorSign   ALEErrorSign

hi ALEWarningSign guifg   = #2BAB00 guibg=#eaebdb cterm=bold
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

" Custom MatchUp
hi MatchWord guifg=blue cterm=underline

let g:colors_name = "acme"
