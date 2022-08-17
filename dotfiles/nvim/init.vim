
" __    __                       __                      __
"|  \  |  \                     |  \                    |  \
"| $$\ | $$  ______    ______  _| $$_    __    __   ____| $$ __    __
"| $$$\| $$ |      \  /      \|   $$ \  |  \  |  \ /      $$|  \  |  \
"| $$$$\ $$  \$$$$$$\|  $$$$$$\\$$$$$$  | $$  | $$|  $$$$$$$| $$  | $$
"| $$\$$ $$ /      $$| $$   \$$ | $$ __ | $$  | $$| $$  | $$| $$  | $$
"| $$ \$$$$|  $$$$$$$| $$       | $$|  \| $$__/ $$| $$__| $$| $$__/ $$
"| $$  \$$$ \$$    $$| $$        \$$  $$ \$$    $$ \$$    $$ \$$    $$
" \$$   \$$  \$$$$$$$ \$$         \$$$$   \$$$$$$   \$$$$$$$ _\$$$$$$$
"                                                           |  \__| $$
"                                                            \$$    $$
"                                                             \$$$$$$
"********************************************************************"
"*********************** VIM CONFIGURATION FILE *********************"
"*********************** Author: HungTran ***************************"
"********************************************************************"


let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

" --- Begin Plugin Manager -----------------

call plug#begin(expand('~/.config/nvim/plugged'))
    " Some Git stuff
    Plug 'tpope/vim-fugitive'

    " Comments code
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdcommenter'

    " LSP support
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'         " Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp'     " LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip'         " Snippets plugin

    Plug 'windwp/nvim-autopairs'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'w0rp/ale'
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Format code
    " Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

    " Highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'pangloss/vim-javascript'
    " Plug 'mxw/vim-jsx'
    " Plug 'leafgarland/typescript-vim'
    " Plug 'peitalin/vim-jsx-typescript'

    " Search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'junegunn/fzf.vim'
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    Plug 'preservim/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'EdenEast/nightfox.nvim'
    " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    " Plug 'dracula/vim', { 'as': 'dracula' }

    " UI stuff
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'jwalton512/vim-blade'
    " Plug 'Yggdroot/indentLine'

    " Distraction-free writing
    Plug 'junegunn/goyo.vim'

    " Other
    Plug 'mhinz/vim-startify'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

filetype plugin indent on

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

if has('mouse')
  set mouse=a
endif

syntax on
set t_Co=256

set nowrap
set winminheight=0

set cursorline
set number
set relativenumber

set autoread
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set pastetoggle=<F3>
set encoding=UTF-8
set nomodeline
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2

" let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

if (has('termguicolors'))
  set termguicolors
endif

" Better display for messages
" set cmdheight=2

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
" let g:material_theme_style = 'palenight-community'
" let g:material_terminal_italics = 1
" colorscheme material

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"================== Plugin Config ======================"
"
"------- Nerdtree config
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Nerdtree tabs config
let g:nerdtree_tabs_open_on_console_startup=1
" Nerdtree Git
let g:NERDTreeGitStatusUseNerdFonts = 1

"------- Fzf mapping
" nnoremap <silent> <C-f> :Files<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" Ignore filename when search in file
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"------- Vim-go
" disable all linters as that is taken care of by coc.nvim
" let g:go_diagnostics_enabled = 0
" let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
" let g:go_jump_to_error = 0

" run go imports on file save
" let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
" let g:go_auto_sameids = 0
" Syntax highlight
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1

"------- Startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'f': '~/.config/fish'},
    \ {'d': '~/.dotfiles' }
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch': ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" custom banner
let g:startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '            Author: HungTran',
 \ '',
 \ '',
 \]

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Navigate snippet placeholders using tab
" let g:coc_snippet_next = '<Tab>'
" let g:coc_snippet_prev = '<S-Tab>'
" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" use tab to navigate snippet placeholders
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" GoTo code navigation.
" nmap <silent> gd :call <SID>GoToDefinition()<CR>
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>do <Plug>(coc-codeaction-selected)

" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" Use K to show documentation in preview window.
" nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" function! s:GoToDefinition()
"   if CocAction('jumpDefinition')
"     return v:true
"   endif

"   let ret = execute("silent! normal \<C-]>")
"   if ret =~ "Error"
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction

" list of the extensions required
" let g:coc_global_extensions = [
"             \'coc-yank',
"             \'coc-pairs',
"             \'coc-json',
"             \'coc-css',
"             \'coc-html',
"             \'coc-tsserver',
"             \'coc-yaml',
"             \'coc-lists',
"             \'coc-snippets',
"             \'coc-prettier',
"             \'coc-ultisnips',
"             \'coc-phpls',
"             \'coc-xml',
"             \'coc-syntax',
"             \'coc-emmet',
"             \'coc-eslint',
"             \'coc-go',
"             \'coc-actions',
"             \]

" ALE
" let g:ale_fixers = {
"             \'*': ['remove_trailing_lines', 'trim_whitespace'],
"             \'javascript': ['prettier'],
"             \'typescript': ['prettier'],
"             \'javascriptreact': ['prettier'],
"             \'typescriptreact': ['prettier'],
"             \'c' : ['clang-format'],
"             \'cpp' : ['clang-format'],
"             \'css' : ['prettier'],
"             \'html' : ['prettier'],
"             \'markdown' : ['prettier'],
"             \'yaml': ['prettier'],
"             \'json': ['prettier'],
"             \'go': ['prettier'],
"             \}
" let g:ale_fix_on_save = 1
" let g:ale_linters_explicit = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_sign_warning = '⚠'
" let g:ale_sign_error = '✘'
" let g:ale_sign_info = ''


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
" Fugitive Conflict Resolution
nnoremap <leader>gdc :Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>

"================== Custom Functions ======================"
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE


""" hide the tilde on non-existed line (for minimalism UI)
set fcs=eob:\
