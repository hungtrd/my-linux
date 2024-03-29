local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "bash",
    "php",
    "python",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "css",
    "html",
    "lua",
    "go",
    "ruby",
    "dockerfile",
    "typescript",
    "javascript"
  },
  autotag = {
    enable = true,
  },
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
