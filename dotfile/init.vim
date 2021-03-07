"****************************************************"
"******** VIM CONFIGURATION FILE ********************"
"******** Author: HungTran **************************"
"****************************************************"



let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" --- Begin Plugin Manager -----------------

call plug#begin(expand('~/.config/nvim/plugged'))
    " Some Git stuff
    Plug 'tpope/vim-fugitive'

    " Comments code
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdcommenter'

    " LSP support
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'

    " Format code
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

    " Highlight
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    " Search
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    Plug 'preservim/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'

    " Theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arcticicestudio/nord-vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }

    " UI stuff
    Plug 'jwalton512/vim-blade'
    " Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " Distraction-free writing
    Plug 'junegunn/goyo.vim'

    " Other
    Plug 'mhinz/vim-startify'

call plug#end()

filetype plugin indent on

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

if has('mouse')
  set mouse=a
endif

syntax on
" set t_Co=256

set nowrap
set winminheight=0

set cursorline
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
set nomodeline

" if (has('nvim'))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" endif
" if (has('termguicolors'))
"   set termguicolors
" endif

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

let mapleader = ","

" Config Nord theme
" let g:nord_cursor_line_number_background = 1
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" colorscheme nord

" Config Material theme
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
colorscheme material

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"================== Plugin Config ======================"
"
" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Nerdtree tabs config
let g:nerdtree_tabs_open_on_console_startup=1

" Vim-airline config --------------
let g:airline_powerline_fonts = 0
let g:airline#themes#clean#palette = 1
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['%3p%%  ',
            \ g:airline_symbols.linenr .' ', 'linenr', ':%c '])
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let g:airline#extensions#ale#enabled = 1                " ALE integration
let airline#extensions#vista#enabled = 1                " vista integration

" Fzf mapping
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" Ignore filename when search in file
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" Startify
let g:startify_session_persistence = 0

" NerdCommenter
autocmd BufRead,BufNewFile *.blade.php set filetype=blade
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" Vim-blade
let g:blade_custom_directives = ['datetime', 'javascript']
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }
" Coc Config

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <silent> K :call CocAction('doHover')<CR>

" list of the extensions required
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-ultisnips',
            \'coc-phpls',
            \'coc-xml',
            \'coc-syntax',
            \'coc-emmet',
            \]

" ALE
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['prettier'],
            \'c' : ['clang-format'],
            \'cpp' : ['clang-format'],
            \'css' : ['prettier'],
            \'html' : ['prettier'],
            \'markdown' : ['prettier'],
            \'yaml': ['prettier'],
            \'json': ['prettier'],
            \}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✘'
let g:ale_sign_info = ''

"================== Windows ======================"
""--Split windows-------------------
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

"================== Custom Mapping ========================"
"================== Custom Functions ======================"
" hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE


""" hide the tilde on non-existed line (for minimalism UI)
set fcs=eob:\
highlight Comment cterm=italic
