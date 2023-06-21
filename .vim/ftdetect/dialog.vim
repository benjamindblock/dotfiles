" Syntax highlighting for dialog (.dg) files
autocmd BufNewFile,BufRead *.dg set filetype=dialog

" Comment string
autocmd FileType dialog setlocal commentstring=%%\ %s
