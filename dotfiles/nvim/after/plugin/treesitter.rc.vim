if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = {
  --  "c", "lua", "go", "gomod",
  --  "javacript", "typescript", "tsx",
  --  "bash", "fish",
  --  "dart", "vim",
  --  "dockerfile",
  --  "html", "json", "markdown", "yaml",
  -- },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
