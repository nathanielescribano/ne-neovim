-- this contains some of my old vim config that I haven't moved over yet
vim.api.nvim_exec(
[[
  " make that cursor stay on the same column
  set virtualedit=all

  " keep the cursor 12 lines from the top and 12 lines from the bottom
  set scrolloff=12

  " disable syntax on long lines
  set synmaxcol=150

  " set period on trailing whitespace
  set list listchars=tab:\ \ ,trail:·

  " automatically update buffer
  set autoread

  " cp yanks the path of the file
  " This does full path. but I've
  " recently been working more with relative path
  " noremap cp :let @+ = expand("%:p")<CR>
  noremap cp :let @+ = expand("%")<CR>

  " switch the mapping of 0 and ^
  " since it's a little easier to
  " reach and more useful IMHO
  noremap 0 ^
  noremap ^ 0

  " set visual bell
  set vb

  " keep history
  set history=100

  " buffer cycling
  nnoremap <Leader>e :bp<CR>
  nnoremap <Leader>o :bn<CR>
  nnoremap <Leader>a :e#<CR>

  " Swap two words
  nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

  " set the search scan so that it ignores case when the search is all lower
  " case but recognizes uppercase if it's specified
  set ignorecase
  set smartcase

  set noswapfile
  set nobackup

  " Remember last location in file
  if has("autocmd")
     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
  endif

  " Edit vimr configuration file
  nnoremap <Leader>ve :e $MYVIMRC<CR>
  " Reload vimr configuration file
  nnoremap <Leader>vr :source $MYVIMRC<CR>

  " disabling ex mode. i hate that shit
  map Q <Nop>

  nmap ( <Nop>
  nmap ) <Nop>

  " Switch plugin
  nnoremap - :Switch<cr>
  let g:switch_custom_definitions =
      \ [
      \   ['->', '=>']
      \ ]

  let g:SeekKey = 'z'
  let g:seek_enable_jumps = 1
  let g:cursorhold_updatetime = 100

  " Opens an edit command with the path of the currently edited file filled in
  " Normal mode: <Leader>e
  map <Leader>h :e <C-R>=expand("%:p:h") . "/" <CR>

  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)
]], true)
