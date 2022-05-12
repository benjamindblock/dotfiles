" BB .vimrc

" Vim not Vi
set nocompatible

" Enable and plugins
filetype plugin on

" Plug-in installation calls for vim-plug
call plug#begin('~/.vim/plugged')
" TPope Commentary
Plug 'https://github.com/tpope/vim-commentary.git'
" TPope Endwise (add end intelligently with Ruby)
Plug 'https://github.com/tpope/vim-endwise.git'
" TPope Vinegar (netrw improvements)
Plug 'https://github.com/tpope/vim-vinegar.git'
" TPope Surround
Plug 'https://github.com/tpope/vim-surround.git'
" AsyncRun
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
" Command-T
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }
" ALE (language linting)
Plug 'https://github.com/dense-analysis/ale.git'
" Iceberg
Plug 'https://github.com/cocopon/iceberg.vim.git'
" Goyo for prose writing
Plug 'https://github.com/junegunn/goyo.vim.git'
" Vim-Pencil for prose writing
Plug 'https://github.com/preservim/vim-pencil.git'
" VOoM Outliner
Plug 'https://github.com/vim-voom/VOoM.git'
call plug#end()

" Theme
set termguicolors
colorscheme bdb_blue

" Highlight the current line
set cursorline

" Display title of file/folder
set title

" Display line numbers
set number

" Easily copy and paste in an out of Vim
set clipboard=unnamed

" Change split size with the mouse
set mouse=n

" Ale linter settings
let g:ale_linters = {
\   'ruby': ['rubocop', 'reek'],
\   'eruby': ['erblint'],
\   'javascript': ['eslint'],
\   'elixir': ['elixir-ls']
\}
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_sign_info = 'oo'
let g:ale_linters_explicit = 1
let g:ale_list_window_size = 5

" Use the line number column for ALE signs
set signcolumn=number

" Custom filetype for Inform6 with comment type defined
autocmd BufNewFile,BufRead *.inf set filetype=inform
autocmd FileType inform setlocal commentstring=!\ %s

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

" Tab and indent settings
set autoindent     " Autoindent when making new line
set tabstop=2      " Set tabs to 2 spaces when reading file
set softtabstop=2  " Set tabs to 2 space when editing
set shiftwidth=2
set expandtab      " Make tabs spaces, not <TAB>

" Only redraw when required
set lazyredraw

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SMART FILE DEFAULTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Commenting out line width for now for text files
  " autocmd FileType text setlocal textwidth=78

  " Syntax highlighting for todo.txt
  autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=todo
  autocmd BufNewFile,BufRead *.[Tt]odo.txt set filetype=todo

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " For ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set ai sw=2 sts=2 et

  " Python settings
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=mkd

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " javascript
  autocmd! FileType javascript set sw=2 sts=2 expandtab

  " Expand tabs in Go. Was gofmt raised in a barn?!
  autocmd! FileType go set sw=4 sts=4 expandtab | retab

  " Two-space indents in json
  autocmd! FileType json set sw=2 sts=2 expandtab

  " Hitting K in a Ruby file opens rdoc, which completely breaks the terminal
  " to the point of having to kill vim and do `reset`. Unmap it entirely.
  nnoremap K <Nop>

  " Compute syntax highlighting from beginning of file. (By default, vim only
  " looks 200 lines back, which can make it highlight code incorrectly in some
  " long files.)
  autocmd BufEnter * :syntax sync fromstart

  " Vim 8.2 adds built-in JSX support which seems broken. Setting these
  " filetypes lets the installed plugins deal with JSX/TSX instead.
  autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
  autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prose Mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let w:ProseModeOn = 0

function EnableProseMode()
  setlocal nocursorline nospell
	Goyo 66
	SoftPencil
	echo "Prose Mode On"
endfu

function DisableProseMode()
	Goyo!
	NoPencil
	setlocal nospell
	echo "Prose Mode Off"
endfu

function ToggleProseMode()
	if w:ProseModeOn == 0
		call EnableProseMode()
		let w:ProseModeOn = 1
	else
		call DisableProseMode()
	endif
endfu

command Prose call EnableProseMode()
command UnProse call DisableProseMode()
command ToggleProse call ToggleProseMode()

function ScratchBufferize()
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
endfu

" Open a StarDict definition in a ScratchBuffer
nnoremap <leader>d :new \| read ! sdcv <C-R><C-W> <CR>:call ScratchBufferize() <CR>:normal gg<CR>

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
" 3. Sometimes you want to run just one test. For that, there's <leader>T,
"    which passes the current line number to the test runner. RSpec knows what
"    to do with this (it will run the first test it finds at or below the
"    given line number). It probably won't work with other test runners.
"    'Focusing' on a single test in this way will be remembered if you hit
"    enter from non-test files, as described above.
"
" 4. Sometimes you don't want contextual test running. In that case, there's
"    <leader>a, which runs everything.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Are we in a test file?
    let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\|test_.*\.py\|_test.py\|.test.ts\|.test.ts\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if in_test_file
        call SetTestFile(command_suffix)
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
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
    " Rspec binstub
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec " . a:filename
    " Fall back to the .test-commands pipe if available, assuming someone
    " is reading the other side and running the commands
    elseif filewritable(".test-commands")
      let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
      exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

      " Write an empty string to block until the command completes
      sleep 100m " milliseconds
      :!echo > .test-commands
      redraw!
    " Fall back to a blocking test run with Bundler
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("spec/**/*.rb"))
      exec ":!bundle exec rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
      exec ":!bin/rails test " . a:filename
    " If we see python-looking tests, assume they should be run with Nose
    elseif strlen(glob("test/**/*.py") . glob("tests/**/*.py"))
      exec "!nosetests " . a:filename
    end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING INFORM6 FILES WITH FROTZ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>c :call RunInformFile()<cr>
nnoremap <leader>x :call CloseFrotz()<cr>

function! RunInformFile()
    " Are we in an Inform6 file?
    let in_inform_file = match(expand("%"), '\(.inf\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if !in_inform_file || expand("%") == ""
        return
    end

    " Write the current file
    :w

    " Change directory to current location
    :lcd %:p:h

    " Compile Inform6 file
    call CompileAndStartFrotz()
endfunction

function! CompileAndStartFrotz()
  let cmd = "kitty @ ls | grep -c '            \"title\": \"frotz-output'"

  # If window already open, close and reopen Frotz
  if system(cmd) == 1
    :AsyncRun! kitty @ --to "$KITTY_LISTEN_ON" close-window --match title:"frotz-output"
      \ && kitty @ --to "$KITTY_LISTEN_ON" new-window --keep-focus --cwd $(pwd) --title "frotz-output" "$SHELL"
      \ && kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"frotz-output" "inform *.inf\x0d"
      \ && kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"frotz-output" "frotz *.z5\x0d"

  # Otherwise, open new
  else
    :AsyncRun! kitty @ --to "$KITTY_LISTEN_ON" new-window --keep-focus --cwd $(pwd) --title "frotz-output" "$SHELL"
      \ && kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"frotz-output" "inform *.inf\x0d"
      \ && kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"frotz-output" "frotz *.z5\x0d"
  endif
endfunction

function! CloseFrotz()
  let cmd = "kitty @ ls | grep -c '            \"title\": \"frotz-output'"
  if system(cmd) == 1
    :AsyncRun! kitty @ --to "$KITTY_LISTEN_ON" close-window --match title:"frotz-output"
  endif
endfunction
