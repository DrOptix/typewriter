return {
	"alexghergh/nvim-tmux-navigation",
	keys = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")

		return {
			{ "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, desc = "Navigate to Nvim/Tmux pane to the left" },
			{ "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, desc = "Navigate to Nvim/Tmux pane below" },
			{ "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, desc = "Navigate to Nvim/Tmux pane above" },
			{ "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, desc = "Navigate to Nvim/Tmux pane to the right" },
		}
	end,
}
