local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that will update your plugins whenever you update this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- tokyo night scheme
	use("folke/tokyonight.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- lsp
	-- managing & installing lsp servers, formatters & linters
	use("williamboman/mason.nvim") -- managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap between mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc.
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- commenting (gc + motion)
	-- gcc (line comment)
	-- gc9j (comment line 1 to line 9 (below))
	use("numToStr/Comment.nvim")

	-- fuzzy finder (telescope)
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better telescope performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- telescope

	-- Barbar Navigation Barbar
	use("nvim-tree/nvim-web-devicons")
	use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons" })

	-- Auto Rename Tag (HTML)
	use("windwp/nvim-ts-autotag")

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Indent Blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Toogle Term
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- Color Highlight
	use("brenoprata10/nvim-highlight-colors")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
