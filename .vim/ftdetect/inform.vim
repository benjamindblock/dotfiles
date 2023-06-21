" Custom filetype for Inform6 with comment type defined
autocmd BufNewFile,BufRead *.inf set filetype=inform
autocmd FileType inform set commentstring=!\ %s
