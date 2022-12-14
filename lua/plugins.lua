local status, packer = pcall(require, "packer")
if (not status) then return end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  use("lewis6991/impatient.nvim")

  -- LSP
	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"jose-elias-alvarez/null-ls.nvim",
    "glepnir/lspsaga.nvim" -- LSP UIs
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
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			--"hrsh7th/cmp-cmdline",
			--"hrsh7th/cmp-git",
			--"rcarriga/cmp-dap",
			--"saadparwaiz1/cmp_luasnip",
			--"onsails/lspkind-nvim",
      --      {"L3MON4D3/LuaSnip", tag = "v1.*"},
			"windwp/nvim-autopairs",
		},
	})

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

  --
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',-- File icons
      'nvim-telescope/telescope-file-browser.nvim',
    },
  }

end)
