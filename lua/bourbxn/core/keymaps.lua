vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { buffer = 0 }

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Move line up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>")

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
keymap.set("n", "<TAB>", "<cmd>BufferNext<cr>")
keymap.set("n", "\\", "<cmd>BufferPrevious<cr>")
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
