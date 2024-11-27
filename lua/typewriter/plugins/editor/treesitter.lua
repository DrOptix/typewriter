return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {},
	opts = {
		-- Enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- Enable indentation
		indent = {
			enable = true,
		},
		-- Ensure these language parsers are installed
		ensure_installed = {
			-- Programming languages
			"c_sharp",
			"lua",
			-- Markup and styling
			"markdown",
			"markdown_inline",
			-- Data formats
			"json",
			"yaml",
			-- Shell and scripting
			"bash",
			"fish",
			-- Others
			"dockerfile",
			"gitignore",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
