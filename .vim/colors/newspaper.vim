" =============================================================================
"
" File:        newspaper.vim
" Description: Vim color scheme file
" Maintainer:  Jimmy Paul; Clayton Parker (cterm colors)
"
" =============================================================================

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "newspaper"

" =============================================================================
hi Normal       guifg=#000000           guibg=#e9e9df           cterm=NONE
hi ColorColumn  guifg=NONE              guibg=#EEEEDD           cterm=NONE
hi Cursor       guifg=bg                guibg=fg                cterm=NONE

hi CursorColumn guifg=NONE              guibg=#FFFDD0           cterm=NONE
hi CursorLine   guifg=NONE              guibg=#ccccc3           cterm=NONE

hi CursorIM     guifg=bg                guibg=fg                cterm=NONE
hi lCursor      guifg=bg                guibg=fg                cterm=NONE
hi DiffAdd      guifg=NONE              guibg=#6bb269           cterm=NONE
hi DiffChange   guifg=NONE              guibg=#a2c6cc           cterm=NONE
hi DiffDelete   guifg=NONE              guibg=#c15e78           cterm=NONE
hi DiffText     guifg=#000000           guibg=#c7eae9           cterm=NONE
hi Directory    guifg=#1600FF           guibg=bg                cterm=NONE
hi ErrorMsg     guifg=#a22727           guibg=NONE              cterm=NONE
hi FoldColumn   guifg=#40587c           guibg=#dcdda8           cterm=NONE
hi Folded       guifg=#40587c           guibg=#b3b3ae           cterm=NONE

hi IncSearch    guifg=#000000           guibg=#d3d47a           cterm=NONE
hi Search       guifg=#000000           guibg=#d3d47a           cterm=NONE
hi LineNr       guifg=#666677           guibg=#cccfbf           cterm=NONE
hi CursorLineNr guifg=#000000           guibg=#cccfbf           cterm=NONE
hi MatchParen   guifg=#000000           guibg=#949555           cterm=NONE
hi ModeMsg      guifg=#ffffff           guibg=#a15c55           cterm=NONE
hi MoreMsg      guifg=#3c613b           guibg=bg                cterm=NONE
hi NonText      guifg=#93aaab           guibg=bg                cterm=NONE

hi Pmenu        guifg=#866a45           guibg=#b7b7a7           cterm=NONE
hi PmenuSel     guifg=#a5a5a5           guibg=#716d51           cterm=NONE
hi PmenuSbar    guifg=#ffffff           guibg=#999666           cterm=NONE
hi PmenuThumb   guifg=#ffffff           guibg=#7B7939           cterm=NONE

hi Question     guifg=#496844           guibg=bg                cterm=NONE
hi SignColumn   guifg=#ffffff           guibg=#b7b7a7           cterm=NONE

hi SpecialKey   guifg=#ffffff           guibg=#adadad           cterm=NONE

hi SpellBad     guisp=#883629                                   cterm=NONE
hi SpellCap     guisp=#1920b2                                   cterm=NONE
hi SpellLocal   guisp=#41796c                                   cterm=NONE
hi SpellRare    guisp=#bb36d7                                   cterm=NONE
hi StatusLine   guifg=#FFFEEE           guibg=#557788           cterm=NONE
hi StatusLineNC guifg=#F4F4EE           guibg=#99aabb           cterm=NONE
hi TabLine      guifg=fg                guibg=#bcbcbc           cterm=NONE
hi TabLineFill  guifg=fg                guibg=bg                cterm=reverse
hi TabLineSel   guifg=fg                guibg=bg                cterm=NONE
hi Title        guifg=#124560           guibg=bg                cterm=NONE
hi VertSplit    guifg=#99aabb           guibg=#99aabb
hi Visual       guifg=#ffffff           guibg=#0a7383           cterm=NONE
hi WarningMsg   guifg=#883629           guibg=bg                cterm=NONE
hi WildMenu     guifg=#000000           guibg=#7ab4cf           cterm=NONE

hi Comment      guifg=#4e5968           guibg=NONE              cterm=NONE
hi Constant     guifg=fg                guibg=NONE              cterm=NONE
hi String       guifg=#1e5432           guibg=NONE              cterm=NONE
hi Boolean      guifg=#6f3d3d           guibg=NONE              cterm=NONE
hi Identifier   guifg=#7e473a           guibg=NONE              cterm=NONE
hi Function     guifg=#590b33           guibg=NONE              cterm=NONE
hi Statement    guifg=#0f58af           guibg=NONE              cterm=NONE
hi Keyword      guifg=#2c4869           guibg=NONE              cterm=NONE
hi PreProc      guifg=#2e3081           guibg=NONE              cterm=NONE
hi Type         guifg=#4d69a7           guibg=NONE              cterm=NONE
hi Special      guifg=#2c694a           guibg=NONE              cterm=NONE
hi Ignore       guifg=bg                guibg=NONE              cterm=NONE
hi Error        guifg=#5a2d2d           guibg=NONE              cterm=NONE
hi Todo         guifg=#675220           guibg=NONE              cterm=NONE
" -----------------------------------------------------------------------------
hi VimError         guifg=#9e3224       guibg=#000000   cterm=NONE
hi VimCommentTitle  guifg=#5a7471       guibg=bg        cterm=NONE
hi qfFileName       guifg=#5b7982       guibg=NONE      cterm=NONE
hi qfLineNr         guifg=#e87334       guibg=NONE      cterm=NONE
hi qfError          guifg=#673420       guibg=NONE      cterm=NONE
" -----------------------------------------------------------------------------
