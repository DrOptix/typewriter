return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = function()
		local nvim_tree = require("nvim-tree")

		return {
			{ "<LEADER>e", ":NvimTreeFindFileToggle<CR>", desc = "Toggle file tree" },
		}
	end,
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		view = {
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local w_h = math.floor(0.9 * screen_w)
					local s_h = math.floor(0.9 * screen_h)
					local center_x = (screen_w - w_h) / 2
					local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
					return {
						border = "rounded",
						relative = "editor",
						row = center_y,
						col = center_x,
						width = w_h,
						height = s_h,
					}
				end,
			},
			width = function()
				return math.floor(vim.opt.columns:get() * 5)
			end,
		},
		filesystem_watchers = {
			enable = true,
		},
	},
}
