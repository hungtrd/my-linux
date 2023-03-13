require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
