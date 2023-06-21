" Syntax highlighting for groff (.groff) files.
autocmd BufNewFile,BufRead *.groff set filetype=groff

" Comment string
autocmd FileType nroff setlocal commentstring=\\#\ %s
