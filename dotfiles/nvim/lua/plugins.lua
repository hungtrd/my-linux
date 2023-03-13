local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI
  use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
  use 'nvim-lualine/lualine.nvim' -- status line
  use 'kyazdani42/nvim-web-devicons' -- icons
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'norcalli/nvim-colorizer.lua'

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Comment code
  use 'tpope/vim-commentary'

  -- LSP
  use 'L3MON4D3/LuaSnip' -- snippet
  use 'onsails/lspkind.nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- completion
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'  -- Use code action for LSP
  use 'MunifTanjim/prettier.nvim' -- Prettier Plugin

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'akinsho/nvim-bufferline.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
end)
