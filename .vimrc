" BB .vimrc

" Plug-in installation calls for vim-plug
call plug#begin('~/.vim/plugged')
" TPope Commentary
Plug 'https://github.com/tpope/vim-commentary.git'
" TPope Endwise (add end intelligently with Ruby)
Plug 'https://github.com/tpope/vim-endwise.git'
" TPope Vinegar (netrw improvements)
Plug 'https://github.com/tpope/vim-vinegar.git'
" ALE (language linting)
Plug 'https://github.com/dense-analysis/ale.git'
" Vader (vim testing)
Plug 'https://github.com/junegunn/vader.vim.git'
" VOoM Outliner
Plug 'https://github.com/vim-voom/VOoM.git'
" Ripgrep
Plug 'https://github.com/jremmen/vim-ripgrep.git'
" Rainbow Parentheses
Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git'
" Parinfer
Plug 'https://github.com/bhurlow/vim-parinfer.git'
" Match-up
Plug 'https://github.com/andymass/vim-matchup.git'
" vim-rec
Plug 'https://github.com/zaid/vim-rec.git'
" HTML5 indentation fixes
Plug 'https://github.com/othree/html5.vim'
" Odin
Plug 'https://github.com/Tetralux/odin.vim.git'
" Terraform
Plug 'https://github.com/hashivim/vim-terraform.git'
call plug#end()

set nocompatible
set shell=bash

" NOTE: Order matters here.
set termguicolors
set cursorline
set background=dark
colorscheme torte

" set background=light
" colorscheme morning

syntax on
filetype plugin on

" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"

" Recutils
let g:recutils_no_folding=1

" Open Netrw splits in the right hand side
let g:netrw_altv=1

"Ctrl+Shift+up move line above"
nmap <C-S-Up> :m -2<CR>

"Ctrl+Shift+down move line below
nmap <C-S-Down> :m +1<CR>

" Display title of file/folder
set title

" VOOm width
let g:voom_tree_width=38

" Display line numbers
set number
set relativenumber

" Easily copy and paste in an out of Vim
set clipboard=unnamed

" Change split size with the mouse
set mouse=n

" Only look at tags and current file for autocomplete
set complete=.,t

" Ale linter settings
let g:ale_linters = {
\   'ruby': ['rubocop', 'reek', 'sorbet'],
\   'eruby': ['erblint'],
\   'javascript': ['eslint'],
\   'tcl': ['nagelfar'],
\   'odin': ['ols'],
\   'python': ['pylint'],
\}
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_sign_info = 'oo'
let g:ale_linters_explicit = 1
let g:ale_list_window_size = 5
let g:ale_virtualtext_cursor = 'disabled'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Use the line number column for ALE signs
set signcolumn=number

" Background color fix for Kitty
let &t_ut=''

" Use an undo file
set undofile

" Storing the undo, swap files in a nice place.
setglobal undodir=$HOME/.vim/tmp//
setglobal backupdir=$HOME/.vim/tmp//
setglobal directory=$HOME/.vim/tmp//
if !isdirectory(&undodir)
  call mkdir(&undodir)
end

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Ignore node module directory. Lots of noise.
" Helps massively with Command+T performance.
set wildignore+=*/node_modules
set wildignore+=*/tmp
set wildignore+=*/storage
set wildignore+=*/app/assets/fonts

" Default tab and indent settings
set autoindent     " Autoindent when making new line
set tabstop=2      " Set tabs to 2 spaces when reading file
set softtabstop=2  " Set tabs to 2 space when editing
set shiftwidth=2
set expandtab      " Make tabs spaces, not <TAB>

" Show the status line at the bottom
set ls=2
set showmatch

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" Adding spacebar as an additional leader
let mapleader="\<Space>"

" Clear out highlighted search terms
nnoremap <leader>, :nohlsearch<CR>

" Return to previous buffer with leader+backspace
nnoremap <leader><BS> <C-^>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Unfuck my screen
nnoremap U :syntax on<cr>:syntax sync fromstart<cr>:redraw!<cr>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show one line above/below cursor at edge of buffer
" Pulled from TPope's Sensible repo
if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Make set :list display better (showing whitespace chars)
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" fzy for fuzzy search
function! FzyCommand(choice_command, fzy_args, vim_command)
  try
    let selection = system(a:choice_command . " | fzy " . a:fzy_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from fzy on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction
nnoremap <leader>t :call FzyCommand("fd -t f -H", "", ":e")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby block indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From Gary Bernhardt's .vimrc
" Do this:
"   first
"     .second do |x|
"       something
"     end
" Not this:
"   first
"     .second do |x|
"     something
"   end
:let g:ruby_indent_block_style = 'do'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_test = match(current_file, '^test/') != -1
  let going_to_test = !in_test
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1  || match(current_file, '\<services\>') != -1 || match(current_file, '\<jobs\>') != -1
  if going_to_test
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_test.rb', '')
    let new_file = 'test/' . new_file
  else
    let new_file = substitute(new_file, '_test\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^test/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Ruby debugging
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SMART FILE DEFAULTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " For Ruby et. al., autoindent with two spaces, always expand tabs
  autocmd! FileType ruby,haml,eruby,yaml,html,sass,cucumber,sql set ai sw=2 sts=2 et

  " Python settings
  autocmd! FileType python set sw=4 sts=4 et

  " Odin
  autocmd! FileType odin set autoindent copyindent preserveindent tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

  " Sass
  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " Markdown settings
  autocmd! BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd! BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd! FileType markdown set sw=4 sts=4 et 

  autocmd! BufRead *.vcl set sw=4 sts=4 et

  " JS
  autocmd! FileType javascript set sw=2 sts=2 expandtab

  " Two-space indents in json
  autocmd! FileType json set sw=2 sts=2 expandtab

  " Lisp settings
  autocmd FileType lisp,clojure,scheme RainbowParentheses
  autocmd filetype lisp,clojure,scheme setlocal equalprg=lispindent.lisp

  " Hitting K in a Ruby file opens rdoc, which completely breaks the terminal
  " to the point of having to kill vim and do `reset`. Unmap it entirely.
  nnoremap K <Nop>

  " Makefile
  autocmd FileType make set noexpandtab sw=2 sts=2
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note taking mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function EnableVOoM()
  Voom markdown
  echo "Note Mode"
endfu
command VOoM call EnableVOoM()
nnoremap ,n :VOoM<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a StarDict definition in a ScratchBuffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ScratchBufferize()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfu
nnoremap ,d :new \| read ! sdcv <C-R><C-W> <CR>:call ScratchBufferize() <CR>:normal gg<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
"
" Test running here is contextual in two different ways:
"
" 1. It will guess at how to run the tests. E.g., if there's a Gemfile
"    present, it will `bundle exec rspec` so the gems are respected.
"
" 2. It remembers which tests have been run. E.g., if I'm editing user_spec.rb
"    and hit enter, it will run rspec on user_spec.rb. If I then navigate to a
"    non-test file, like routes.rb, and hit return again, it will re-run
"    user_spec.rb. It will continue using user_spec.rb as my 'default' test
"    until I hit enter in some other test file, at which point that test file
"    is run immediately and becomes the default. This is complex to describe
"    fully, but simple to use in practice: always hit enter to run tests. It
"    will run either the test file you're in or the last test file you hit
"    enter in.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Are we in a test file?
    let in_test_file = match(expand("%"), '\(_test.rb\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if in_test_file
        call SetTestFile(command_suffix)
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file)
endfunction

function! SetTestFile(command_suffix)
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end

    " The file is executable; assume we should run
    if executable(a:filename)
      exec ":!./" . a:filename
    " Project-specific test script
    elseif filereadable("bin/test")
      exec ":!bin/test " . a:filename
    " Fall back to a blocking test run with Bundler
    elseif filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
      exec ":!bin/rails test " . a:filename
    end
endfunction
