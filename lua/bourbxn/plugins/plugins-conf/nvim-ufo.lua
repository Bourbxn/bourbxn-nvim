local setup, ufo = pcall(require, "ufo")
if not setup then
	return
end

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})
