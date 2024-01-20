-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tl", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>th", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
keymap.set("n", "<leader>zy", "va{Vy")
keymap.set("n", "<leader>zz", "va{y")
keymap.set("n", "<leader>zd", "va{Vd")
keymap.set("n", "<leader>za", "ggVGy")
keymap.set("n", "<leader>z:", "0f:wv$y")
keymap.set("n", "<leader>z=", "0f=wv$y")

-- nvim-tree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>git", ":Neotree float git_status<CR>") -- toggle file explorer

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- toggle terminal
keymap.set("n", "<leader>tm", "<cmd>:ToggleTerm direction=float<CR>") -- mapping to restart lsp if necessary
---- leap ----
keymap.set("n", "<leader>l", "<Plug>(leap-forward)", {})
keymap.set("n", "<leader>h", "<Plug>(leap-backward)", {})

-- undotree
-- keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)

-- bufferline
keymap.set("n", "<leader>tn", ":tabnew<CR>")
keymap.set("n", "<leader>bl", ":BufferLinePick<CR>")
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1 <CR>")
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2 <CR>")
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3 <CR>")
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4 <CR>")

-- tmux-navigator
-- vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>")
-- vim.keymap.set("n", "<C-j", ":TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>")
