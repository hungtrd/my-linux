lua <<EOF
  require('telescope').setup({
    defaults = {
      layout_config = {
        vertical = { width = 0.5 }
        -- other layout configuration here
      },
      -- other defaults configuration here
    },
    -- other configuration values here
  })
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

