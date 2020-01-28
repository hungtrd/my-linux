set t_Co=256
set nocompatible

"-----------Begin Vundle---------

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}                                      
  Plugin 'ascenator/L9', {'name': 'newL9'}
  Plugin 'scrooloose/nerdtree'
  Plugin 'wincent/command-t'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'tpope/vim-commentary'
  Plugin 'yggdroot/indentline'
  "--- Syntax checking ---
  " Plugin 'w0rp/ale' 
  "--- Code completion ---
  " Plugin 'mattn/emmet-vim'
  "--- Code highlight ---
  " Plugin 'pangloss/vim-javascript'
  " Plugin 'mxw/vim-jsx'
  " Plugin 'maxmellon/vim-jsx-pretty'
  " Plugin 'shmargum/vim-sass-colors'
  " Plugin 'ap/vim-css-color'
  "--- Vim status bar ---
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "--- Theme---
  Plugin 'dracula/vim'
  Plugin 'tyrannicaltoucan/vim-quantum'
call vundle#end()


filetype plugin indent on

"------------End Vundle-----------



" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

map Q gq
"----------------Windows-----------
"--Split windows-------------------
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move Windows
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l

map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize Windows
nmap <C-w><left> <C-w> <
nmap <C-w><right> <C-w> >
nmap <C-w><up> <C-w> +
nmap <C-w><right> <C-w> -



" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
map <C-n> :NERDTreeToggle<CR>

syntax on
set number
set relativenumber
set autoread
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set pastetoggle=<F3>
set background=dark
" set termguicolors
colorscheme dracula
set nomodeline

" Config for Emmet
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript.js' : {
\    'extends' : 'js',
\  },
\}
" Config Vim-Airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
