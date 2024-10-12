local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw at the very start of nvim-tree.lua
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	-- change folder arrow icons
	view = {
		signcolumn = "no",
		width = 30, -- Ensure width matches the intended alignment
		side = "left",
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
				git = {
					untracked = "",
				},
			},
		},
	},
	-- for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
