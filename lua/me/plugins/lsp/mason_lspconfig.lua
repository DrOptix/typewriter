return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = {
            "lua_ls",
			"omnisharp",
            "rust_analyzer",
		},
	},
}