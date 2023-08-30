vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = ';'

vim.wo.number = true

vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- disable netrw at the very start of your init.lua (nvim-tree recommended)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Undercurl
-- not work on iTerm2
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leave insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Set tabstop
vim.api.nvim_command('autocmd FileType go setlocal shiftwidth=4 tabstop=4 expandtab')

-- Set filetype
vim.api.nvim_command('au BufNewFile,BufRead *.psql set filetype=sql')

-- copilot
-- imap("<silent><script><expr>", "<C-J>", "copilot#Accept(\"\\<\CR>\")")
local opts = { noremap = true, silent = true, expr = true }
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("\\<CR>")', opts)
vim.g.copilot_no_tab_map = true
