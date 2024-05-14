vim.g.mapleader = " "

local keymap = vim.keymap
local map = vim.api.nvim_set_keymap

local options = { noremap = true }

keymap.set("i", "jk", "<Esc>", { desc = "clear search highlights" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlights" })
keymap.set("n", "<S-CR>", "O<Esc>", { desc = "new line above" })
keymap.set("n", "<CR>", "o<Esc>", { desc = "new line down" })

keymap.set("n", "<C-j>", "<C-w>j", { desc = "move cursor down split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "move cursor up split" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "move cursor left split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "move cursor right split" })

map("i", "<C-j>", "<Esc>:m .+1<CR>a", options)
map("i", "<C-k>", "<Esc>:m .-2<CR>a", options)
map("v", "<C-j>", ":m '>+1<CR>gv=gv", options)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", options)

map("n", "<leader>p", '"+p', options)
map("v", "<leader>p", '"+p', options)
map("v", "<leader>y", '"+y', options)

map("n", "<leader>d", '"_d', options)
map("v", "<leader>d", '"_d', options)
map("n", "<leader>c", '"_c', options)
