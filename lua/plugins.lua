local status, packer = pcall(require, "packer")
if (not status) then return end

local win = vim.fn.has("win32") == 1

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  use("lewis6991/impatient.nvim")

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "jose-elias-alvarez/null-ls.nvim",
    "glepnir/lspsaga.nvim", -- LSP UIs
  })
  -- Installation of LSP/Debuggers/Other
  use({
    "onsails/lspkind-nvim", -- vscode-like pictograms
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  })

  -- Completion
  use({
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-git",
    "hrsh7th/cmp-cmdline",
    "aca/emmet-ls",
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
  })

  if win then
    use {
      'tzachar/cmp-tabnine',
      after = "nvim-cmp",
      run = 'powershell ./install.ps1',
      requires = 'hrsh7th/nvim-cmp'
    }
  else
    use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp'
    }
  end

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  })

  use "nvim-lualine/lualine.nvim" -- Statusline
  use 'norcalli/nvim-colorizer.lua'

  -- Theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons', -- File icons
    'nvim-telescope/telescope-file-browser.nvim',
  }
  -- file managing , picker etc
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }

  -- Alpha Neovim
  use {
    'goolord/alpha-nvim',
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    keys = { "gcc" },
    config = function()
      require('Comment').setup()
    end
  }

  use 'akinsho/nvim-bufferline.lua'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'folke/zen-mode.nvim'
  use 'windwp/nvim-ts-autotag'

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
end)
