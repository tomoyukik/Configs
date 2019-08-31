set shell=bash

"dein 設定 ===============================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " 自動補完
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    " pip3 install --upgrade neovim
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  let g:deoplete#enable_at_startup = 1

  " メソッド定義
  " call dein#add('szw/vim-tags')

  call dein#add('tpope/vim-fugitive')

  " linter
  call dein#add('vim-syntastic/syntastic')

  " haskell
  call dein#add('neovimhaskell/haskell-vim', { 'on_ft': 'haskell' })

  " ruby
  call dein#add('ngmy/vim-rubocop', { 'on_ft': 'ruby' })
  call dein#add('vim-ruby/vim-ruby', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-endwise', { 'on_ft': 'ruby' })

  " textile
  " call dein#add('timcharper/textile.vim', { 'on_ft': 'textile' })
  " call dein#add('amiorin/vim-textile', { 'on_ft': 'textile' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
" ========================================

" Configuration file for vim
set modelines=0		" CVE-2007-2438
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" self-customize
syntax on
set number
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set laststatus=2
set statusline=[%n]
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
set statusline+=%<%F
set showcmd
set spell
set cursorline

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 
highlight StatusLine term=NONE cterm=NONE ctermfg=88 ctermbg=NONE
highlight StatusLineNC term=NONE cterm=NONE ctermfg=138 ctermbg=NONE
highlight VertSplit term=NONE cterm=NONE ctermfg=251 ctermbg=NONE
highlight LineNr term=underline ctermfg=251 guifg=Grey
highlight EndOfBuffer ctermfg=251
highlight CursorLineNr ctermfg=88 ctermbg=224

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

nnoremap ; :

" Linter ==================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop']
" ==================================================

