-- Setup leader key to `Space`
vim.g.mapleader = " "

-----------------------
-- Window management --
-----------------------
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set(
	"n",
	"H",
	":vertical resize -2<CR>",
	{ desc = "Decrease split horizontal size", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"L",
	":vertical resize +2<CR>",
	{ desc = "Increase split horizontal size", noremap = true, silent = true }
)
vim.keymap.set("n", "J", ":resize +2<CR>", { desc = "Decrease split horizontal size", noremap = true, silent = true })
vim.keymap.set("n", "K", ":resize -2<CR>", { desc = "Increase split horizontal size", noremap = true, silent = true })

---------------------
-- Tabs management --
---------------------
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

------------
-- Editor --
------------
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
