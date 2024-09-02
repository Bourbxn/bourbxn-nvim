local saga_setup, saga = pcall(require, "lspsaga")
if not saga_setup then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = true,
		show_file = true,
		folder_level = 1,
		respect_root = false,
		color_mode = false,
	},
})
