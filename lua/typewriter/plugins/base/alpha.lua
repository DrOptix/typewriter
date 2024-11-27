return {
	"goolord/alpha-nvim",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<cr>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<cr>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("SPC fr", "  > Find recent files", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<cr>"),
		}

		return dashboard
	end,
	config = function(_, dashboard)
		require("alpha").setup(dashboard.opts)
	end,
}
