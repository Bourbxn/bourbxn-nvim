local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
	return
end

local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_setup then
	return
end

-- list of servers for mason to install
local servers = {
	"ts_ls", -- javascript & typescript
	"html", -- html
	"cssls", -- css
	"tailwindcss", -- tailwind css
	"lua_ls", -- lua
	"jdtls", -- java
	"dockerls", -- docker
	"emmet_ls", -- emmet
	"gopls", -- golang
}

-- list of linters & formatters for mason to install
local formatters = {
	"prettier", -- ts, js formatter
	"eslint_d", -- ts, js linter
	"stylua", -- lua formatter
	"hadolint", -- docker linter
}

mason.setup()

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true, -- auto-install configured servers (with lspconfig)
})

mason_null_ls.setup({
	ensure_installed = formatters,
	automatic_installation = true, -- auto-install configured formatters & linters (with null-ls)
})
