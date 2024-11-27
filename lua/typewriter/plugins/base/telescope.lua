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
	opts = function()
        local actions = require("telescope.actions")
		local opts = {
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
		}
		return opts
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in CWD" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in CWD" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in CWD" },
		{ "<leader>fb", "<CMD>Telescope buffers<cr>", desc = "Fuzzy find open buffers" },
		{ "<leader>fk", "<CMD>Telescope keymaps<cr>", desc = "Fuzzy find keybindings" },
	},
}
