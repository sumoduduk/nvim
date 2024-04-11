-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tl", ":tabn<CR>")
keymap.set("n", "<leader>th", ":tabp<CR>")

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>zy", "va{Vy")
keymap.set("n", "<leader>zz", "va{y")
keymap.set("n", "<leader>zd", "va{Vd")
keymap.set("n", "<leader>za", "ggVGy")
keymap.set("n", "<leader>z:", "0f:wv$y")
keymap.set("n", "<leader>z=", "0f=wv$y")

keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("n", "<leader>rs", ":LspRestart<CR>")

keymap.set("n", "<leader>l", "<Plug>(leap-forward)", {})
keymap.set("n", "<leader>h", "<Plug>(leap-backward)", {})

keymap.set("n", "<leader>tn", ":tabnew<CR>")
keymap.set("n", "<leader>bl", ":BufferLinePick<CR>")
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1 <CR>")
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2 <CR>")
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3 <CR>")
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4 <CR>")

-- tmux-navigator
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>")
-- vim.keymap.set("n", "<C-j", ":TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>")
