return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	lazy = false,
	config = function()
		require("gruvbox").setup()
		vim.cmd([[colorscheme gruvbox]])
	end,
}
