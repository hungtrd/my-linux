"****************************************************"
"******** VIM CONFIGURATION FILE ********************"
"******** Author: HungTran **************************"
"****************************************************"



let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'





call plug#end()

" Required:
filetype plugin indent on

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e






" Vim-airline config --------------
let g:airline#extensions#tabline#formatter = 'unique_tail'


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
set encoding=UTF-8
set background=dark
colorscheme dracula


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

