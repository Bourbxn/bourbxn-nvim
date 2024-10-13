vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { buffer = 0 }

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>er", "<C-w>w")

-- exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Move line up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout)
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout)
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview

-- barbar
keymap.set("n", "}", "<cmd>BufferNext<cr>")
keymap.set("n", "{", "<cmd>BufferPrevious<cr>")
keymap.set("n", "1<TAB>", "<cmd>BufferGoto 1<cr>")
keymap.set("n", "2<TAB>", "<cmd>BufferGoto 2<cr>")
keymap.set("n", "3<TAB>", "<cmd>BufferGoto 3<cr>")
keymap.set("n", "4<TAB>", "<cmd>BufferGoto 4<cr>")
keymap.set("n", "5<TAB>", "<cmd>BufferGoto 5<cr>")
keymap.set("n", "6<TAB>", "<cmd>BufferGoto 6<cr>")
keymap.set("n", "7<TAB>", "<cmd>BufferGoto 7<cr>")
keymap.set("n", "8<TAB>", "<cmd>BufferGoto 8<cr>")
keymap.set("n", "9<TAB>", "<cmd>BufferGoto 9<cr>")
keymap.set("n", "<leader>hh", "<cmd>BufferMovePrevious<cr>")
keymap.set("n", "<leader>ll", "<cmd>BufferMoveNext<cr>")
keymap.set("n", "<leader>cc", "<cmd>BufferClose<cr>")

-- Trouble
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Noice
keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>")

-- Avante
keymap.set({ "n", "v" }, "<leader>aa", "<cmd>AvanteAsk<cr>")
keymap.set("n", "<leader>ar", "<cmd>AvanteRefresh<cr>")
keymap.set({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<cr>")
keymap.set({ "n", "v" }, "<leader>ac", "<cmd>AvanteChat<cr>")
keymap.set("n", "<leader>af", "<cmd>AvanteFocus<cr>")

-- LazyGit
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- DAP
keymap.set("n", "<Leader>dc", function()
	require("dap").continue()
end)
keymap.set("n", "<Leader>do", function()
	require("dap").step_over()
end)
keymap.set("n", "<Leader>di", function()
	require("dap").step_into()
end)
keymap.set("n", "<Leader>dt", function()
	require("dap").step_out()
end)
keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, input("Log point message: "))
end)
keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

-- DAP UI
keymap.set("n", "<Leader>db", function()
	vim.cmd("NvimTreeClose")
	require("dapui").toggle()
end)
