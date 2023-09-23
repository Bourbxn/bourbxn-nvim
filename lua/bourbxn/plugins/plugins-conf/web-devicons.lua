local setup, web_devicons = pcall(require, "nvim-web-devicons")
if not setup then
	return
end

web_devicons.setup({
	override = {
		js = {
			icon = "󰌞",
			color = "#efd81b",
			name = "javascript",
		},
		cjs = {
			icon = "󰌞",
			color = "#efd81b",
			name = "cjavascript",
		},
		ts = {
			icon = "󰛦",
			color = "#2e79c7",
			name = "typescript",
		},
	},
	default = true,
})
