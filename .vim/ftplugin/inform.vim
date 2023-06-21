""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING INFORM6 FILES WITH FROTZ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Renable when required
" nnoremap <leader>c :call RunInformFile()<cr>
" nnoremap <leader>x :call CloseFrotz()<cr>

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
