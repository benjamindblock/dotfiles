" Name:         bdb_light (Based on freyeday)
" Description:  Light vim colorscheme for the Friday and other *days.
" Author:       Maxim Kim <habamax@gmail.com>
" Maintainer:   Maxim Kim <habamax@gmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Tue Sep 14 21:07:12 2021

" Generated by Colortemplate v2.1.0

set background=light

hi clear
let g:colors_name = 'bdb_light'

hi Normal             guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
hi EndOfBuffer        guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi StatusLine         guifg=#ffffff guibg=#000000 gui=bold cterm=bold
hi StatusLineNC       guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
hi StatusLineTerm     guifg=#ffffff guibg=#5f8787 gui=NONE cterm=NONE
hi StatusLineTermNC   guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
hi VertSplit          guifg=#bcbcbc guibg=#bcbcbc gui=NONE cterm=NONE
hi Pmenu guifg=NONE   guibg=#bcbcbc gui=NONE cterm=NONE
hi PmenuSel           guifg=#000000 guibg=#dddddd gui=NONE cterm=NONE
hi PmenuSbar          guifg=NONE guibg=#8a8a8a gui=NONE cterm=NONE
hi PmenuThumb         guifg=NONE guibg=#000000 gui=NONE cterm=NONE
hi TabLine            guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
hi TabLineFill        guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
hi TabLineSel         guifg=#ffffff guibg=#5f8787 gui=NONE cterm=NONE
hi ToolbarLine        guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarButton      guifg=#000000 guibg=#87afaf gui=NONE cterm=NONE
hi NonText            guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi SpecialKey         guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
hi Folded             guifg=#8a8a8a guibg=#ffffff gui=NONE cterm=NONE
hi Visual             guifg=#000000 guibg=#cccccc gui=NONE cterm=NONE
hi VisualNOS          guifg=#000000 guibg=#cccccc gui=NONE cterm=NONE
hi LineNr             guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
hi FoldColumn         guifg=#8a8a8a guibg=#ffffff gui=NONE cterm=NONE
hi CursorLine         guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
hi CursorColumn       guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
hi CursorLineNr       guifg=#000000 guibg=#eeeeee gui=bold cterm=bold
hi QuickFixLine       guifg=NONE guibg=#dadada gui=NONE cterm=NONE
hi SignColumn         guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined         guifg=#00b3a4 guibg=NONE gui=underline cterm=underline
hi Error              guifg=#d70000 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg           guifg=#d70000 guibg=NONE gui=NONE cterm=NONE
hi ModeMsg            guifg=#000000 guibg=#dddddd gui=NONE cterm=NONE
hi WarningMsg         guifg=#00b3a4 guibg=NONE gui=NONE cterm=NONE
hi MoreMsg            guifg=#005faf guibg=NONE gui=NONE cterm=NONE
hi Question           guifg=#00b3a4 guibg=NONE gui=NONE cterm=NONE
hi Todo               guifg=#000000 guibg=#ffffff gui=bold cterm=bold
hi MatchParen         guifg=#33374c guibg=#bec0c9 gui=bold cterm=bold 
hi Search             guifg=#ffffff guibg=#0040d2 gui=bold cterm=bold
hi CurSearch          guifg=#ffffff guibg=#c900c5 gui=NONE cterm=NONE
hi IncSearch          guifg=#000000 guibg=#7ff7ff gui=NONE cterm=NONE
hi WildMenu           guifg=#000000 guibg=#dddddd gui=NONE cterm=NONE
hi ColorColumn        guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi Cursor             guifg=#ffffff guibg=#1c1c1c gui=NONE cterm=NONE
hi lCursor            guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
hi DiffAdd            guifg=NONE guibg=#e4eee4 gui=NONE cterm=NONE
hi DiffChange         guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
hi DiffText           guifg=#ffffff guibg=#0087d7 gui=NONE cterm=NONE
hi DiffDelete         guifg=#d75f5f guibg=#eee4e4 gui=NONE cterm=NONE
hi SpellBad           guifg=#d70000 guibg=NONE guisp=#d70000 gui=undercurl cterm=underline
hi SpellCap           guifg=#d75f5f guibg=NONE guisp=#d75f5f gui=undercurl cterm=underline
hi SpellLocal         guifg=#00b3a4 guibg=NONE guisp=#00b3a4 gui=undercurl cterm=underline
hi SpellRare          guifg=#dddddd guibg=NONE guisp=#dddddd gui=undercurl cterm=underline
hi Comment            guifg=#777777 guibg=NONE gui=NONE cterm=NONE
hi Identifier         guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Function           guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Statement          guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Constant           guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi String             guifg=#777777 guibg=NONE gui=NONE cterm=NONE
hi Character          guifg=#216609 guibg=NONE gui=NONE cterm=NONE
hi PreProc            guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Type               guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Special            guifg=#000000 guibg=NONE gui=NONE cterm=NONE
hi Directory          guifg=#0040d2 guibg=NONE gui=bold cterm=bold
hi netrwExe           guifg=#27ce00 guibg=NONE gui=bold cterm=bold
hi Conceal            guifg=#8a8a8a guibg=NONE gui=NONE cterm=NONE
hi Ignore             guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title              guifg=#000000 guibg=NONE gui=bold cterm=bold

hi ALEError guifg         = #000000 guibg=NONE cterm=underline
hi! link ALEStyleError       ALEError
hi! link ALEWarning          ALEError
hi! link ALEStyleWarning     ALEError
hi! link ALEInfo             ALEError
hi ALEErrorSign guifg     = #F60000 guibg=#e4e4e4 cterm=bold
hi! link ALEStyleErrorSign   ALEErrorSign
hi ALEWarningSign guifg   = #2BAB00 guibg=#e4e4e4 cterm=bold
hi! link ALEStyleWarningSign ALEWarningSign
hi! link ALEInfoSign         ALEWarningSign

" hi markdownH1 guifg=#266E00 guibg=NONE gui=bold cterm=bold
" hi! link markdownH2 markdownH1
" hi! link markdownH3 markdownH1
" hi! link markdownH4 markdownH1
" hi! link markdownH5 markdownH1
" hi! link markdownH6 markdownH1