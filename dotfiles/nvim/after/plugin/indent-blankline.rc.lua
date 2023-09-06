vim.opt.termguicolors = true
-- vim.opt.list = true
vim.cmd [[highlight IndentBlanklineContextChar guifg=#81A1C1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#00FF00 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#00FF00 gui=nocombine]]
require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineContextStart",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineContextStart",
  },
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_current_context_start = true,
}
