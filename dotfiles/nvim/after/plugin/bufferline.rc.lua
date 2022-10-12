local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#434C5E',
      bg = '#3B4252',
    },
    separator_selected = {
      fg = '#434C5E',
    },
    background = {
      fg = '#81A1C1',
      bg = '#3B4252',
      italic = true,
    },
    buffer_selected = {
      fg = '#E5E9F0',
      bold = true,
      italic = false
    },
    fill = {
      bg = '#434C5E'
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
