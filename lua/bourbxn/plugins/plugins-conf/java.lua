local setup, java = pcall(require, "java")
if not setup then
	return
end

local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
	return
end

java.setup({
	notifications = {
		dap = false,
	},
})
lspconfig.jdtls.setup({})
