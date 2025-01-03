return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		-- Utility library for Neovim plugins.
		"nvim-lua/plenary.nvim",

		-- `fzf` sorter for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

		-- Filetype icons for Neovim plugins and status lines.
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "%.git/.*" },
				mappings = {
					i = {
						-- Move to previous result
						["<C-k>"] = actions.move_selection_previous,

						-- Move to next result
						["<C-j>"] = actions.move_selection_next,

						-- Close telescope window
						["<C-q>"] = actions.close,
					},
					n = {
						-- Close telescope window
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["d"] = actions.delete_buffer,
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-----------------
		-- KEYBINDINGS --
		-----------------
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in CWD" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in CWD" })
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in CWD" }
		)
		vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<cr>", { desc = "Fuzzy find open buffers" })
		vim.keymap.set("n", "<leader>fk", "<CMD>Telescope keymaps<cr>", { desc = "Fuzzy find keybindings" })
	end,
}
