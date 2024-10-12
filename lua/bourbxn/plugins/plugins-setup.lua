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

local status = pcall(require, "packer")
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
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}) -- autoclose tags

	-- auto pair
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	-- commenting (gc + motion)
	-- gcc (line comment)
	-- gc9j (comment line 1 to line 9 (below))
	use("numToStr/Comment.nvim")

	-- fuzzy finder (telescope)
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better telescope performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- telescope

	-- Bar Navigation
	use("romgrk/barbar.nvim")

	-- Auto Rename Tag (HTML)

	-- Dashboard
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                     ]],
						[[       ████ ██████           █████      ██                     ]],
						[[      ███████████             █████                             ]],
						[[      █████████ ███████████████████ ███   ███████████   ]],
						[[     █████████  ███    █████████████ █████ ██████████████   ]],
						[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
						[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
						[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
					}, --your header
					center = {
						{
							icon = "󰝰   ",
							icon_hl = "Title",
							desc = "Recent project                    ",
							key = "p",
							key_format = " %s", -- remove default surrounding `[]`
							action = "Telescope projects",
						},
						{
							icon = "󰈙   ",
							icon_hl = "Title",
							desc = "Recent File",
							key = "r",
							key_format = " %s", -- remove default surrounding `[]`
							action = "Telescope oldfiles",
						},
						{
							icon = "󰈞   ",
							icon_hl = "Title",
							desc = "Find File",
							key = "f",
							key_format = " %s", -- remove default surrounding `[]`
							action = "Telescope find_files",
						},
						{
							icon = "   ",
							icon_hl = "Title",
							desc = "Config",
							key = "c",
							key_format = " %s", -- remove default surrounding `[]`
							action = "edit ~/.config/nvim/",
						},
						{
							icon = "󰈆   ",
							icon_hl = "Title",
							desc = "Exit",
							key = "q",
							key_format = " %s", -- remove default surrounding `[]`
							action = "q",
						},
					},
					footer = {
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						"neovim loaded 49 packages",
					}, --your footer
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Indent Blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Toogle Term
	use("akinsho/toggleterm.nvim")

	-- Color Highlight
	use("brenoprata10/nvim-highlight-colors")

	-- Java LSP
	use("mfussenegger/nvim-jdtls")

	-- project manager
	-- Lua
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Surround Nvim
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Trouble.nvim
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Nui.nvim
	use("MunifTanjim/nui.nvim")

	-- Notify.nvim
	use("rcarriga/nvim-notify")

	-- Noice.nvim
	use({
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	-- Scroll Smooth
	use("karb94/neoscroll.nvim")

	-- UFO
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- statuscol to Support UFO
	use({
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				segments = {
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{
						text = { " ", builtin.foldfunc, " " },
						condition = { builtin.not_empty, true, builtin.not_empty },
						click = "v:lua.ScFa",
					},
				},
			})
		end,
	})

	-- todo comment
	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Movement
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	})

	-- Dressing
	use({ "stevearc/dressing.nvim" })

	-- Image Clip
	use({
		"HakonHarnes/img-clip.nvim",
	})

	-- Markdown
	use({
		"MeanderingProgrammer/render-markdown.nvim",
		after = { "nvim-treesitter" },
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("render-markdown").setup({ file_types = { "markdown", "Avante", "vimwiki" } })
		end,
	})

	-- AI Chat
	use({
		"yetone/avante.nvim",
		build = "make BUILD_FROM_SOURCE=true",
		lazy = false,
		version = false,
		BUILD_FROM_SOURCE = true,
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"HakonHarnes/img-clip.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
		},
	})

	-- gitsign
	use({ "lewis6991/gitsigns.nvim" })

	-- Lazygit
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Kuala
	use({
		"mistweaverco/kulala.nvim",
		opts = {},
		config = function()
			require("kulala").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
