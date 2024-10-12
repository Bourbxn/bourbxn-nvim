-- local setup, barbar = pcall(require, "barbar")
-- if not setup then
-- 	return
-- end
--
-- barbar.setup({
-- auto_hide = 1,
-- animation = true,
-- maximum_length = 30,
-- })

require("barbar").setup({
	auto_hide = 1,
	animation = true,
	maximum_length = 30,
	hide = { extensions = true },
	icons = {
		-- Configure the base icons on the bufferline.
		buffer_index = false,
		buffer_number = false,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		filetype = {
			-- Sets the icon's highlight group.
			-- If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- Requires `nvim-web-devicons` if `true`
			enabled = true,
		},
		separator = { left = "", right = "▕" },

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "●" },
		pinned = { buffer_index = true, filename = true, button = "", separator = { right = "▕", left = "" } },

		-- Configure the icons on the bufferline based on the visibility of a buffer.
		-- Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = false },
		inactive = { button = "", separator = { left = "", right = "▕" } },
		visible = { modified = { buffer_number = false } },
	},
	sidebar_filetypes = {
		-- ["neo-tree"] = { event = "BufWipeout" },
		["NvimTree"] = { text = "File Explorer" },
	},
	-- icon_pinned = '󰐃',
	exclude_ft = { "netrw" },
	-- closable = false,
	highlight_visible = false,
})
