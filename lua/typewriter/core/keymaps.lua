-- Setup leader key to `Space`
vim.g.mapleader = " "

local function map(mode, keymap, action, desc)
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, keymap, action, opts)
end

-----------------------
-- Window management --
-----------------------

-- Window splits
map("n", "<leader>sv", "<C-w>v", "Split window vertically")
map("n", "<leader>sh", "<C-w>s", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Make splits equal size")
map("n", "<leader>sx", "<cmd>close<CR>", "Close current split")

-- Resize window using Ctrl + Arrow Key
map("n", "<C-Up>", "<CMD>resize +2<CR>", "Increase split height")
map("n", "<C-Down>", "<CMD>resize -2<CR>", "Decrease split height")
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", "Decrease split width")
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", "Increase split width")

---------------------
-- Tabs management --
---------------------
map("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
map("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
map("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")

------------
-- Editor --
------------
map("n", "<leader>nh", ":nohl<CR>", "Clear search highlights")

-- Move lines up / down
map("v", "J", ":m '>+1<CR>gv=gv", "Move selected lines down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected lines up")

