local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	indent = { enable = false }, -- enable indentation

	-- ensure these language parsers are installed
	ensure_installed = {
		"python",
		"c_sharp",
		"cpp",
		"c",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"vue",
		"dockerfile",
		"gitignore",
		"go",
		"java",
	},
	auto_install = true, -- auto install above language parsers
})

-- to make sure that tree-sitter is using gcc
require("nvim-treesitter.install").compilers = { "gcc" }
