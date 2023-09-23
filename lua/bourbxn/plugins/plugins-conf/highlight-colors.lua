local setup, highlight_colors = pcall(require, "nvim-highlight-colors")
if not setup then
	return
end

highlight_colors.setup({
	render = "background", -- or 'foreground' or 'first_column'
	enable_tailwind = true,
})
