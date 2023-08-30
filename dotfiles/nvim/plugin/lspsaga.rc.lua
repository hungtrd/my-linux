local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)

-- keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_type_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
keymap('n', '<leader>gt', '<Cmd>Lspsaga term_toggle<CR>', opts)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
