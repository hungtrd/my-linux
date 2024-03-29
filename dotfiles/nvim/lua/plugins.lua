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
  use 'EdenEast/nightfox.nvim'
  use 'shaunsingh/nord.nvim'
  use 'nvim-lualine/lualine.nvim' -- status line
  use 'kyazdani42/nvim-web-devicons' -- icons
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use "lukas-reineke/indent-blankline.nvim" -- indent line
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
  use 'tpope/vim-surround'

  -- LSP
  use 'onsails/lspkind.nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- completion
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  -- use({
  --   'nvimdev/lspsaga.nvim',
  --   after = 'nvim-lspconfig',
  --   config = function()
  --     require('lspsaga').setup({
  --       ui = {
  --         code_action = '',
  --       }
  --     })
  --   end,
  -- })
  use({ -- snippet
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    tag = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    -- run = "make install_jsregexp",
    requires = {
      'rafamadriz/friendly-snippets',
    }
  })

  -- AI
  use 'github/copilot.vim'
  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

  use 'jose-elias-alvarez/null-ls.nvim' -- Use code action for LSP
  use 'MunifTanjim/prettier.nvim' -- Prettier Plugin

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'akinsho/nvim-bufferline.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Track coding time
  use 'wakatime/vim-wakatime'
end)
