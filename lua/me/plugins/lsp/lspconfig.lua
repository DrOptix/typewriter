return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		-- Diagnostic symbols to use in the sign column
		signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		},
	},
	config = function(_, opts)
		-- When an LSP attached to the buffer set those buffer local keybindings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local key_opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				key_opts.desc = "Lists LSP references for word under the cursor"
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", key_opts)

				key_opts.desc =
					"Goto the definition of the word under the cursor, if there's only one, otherwise show all options in `telescope`"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", key_opts)

				opts.desc =
					"Goto the implementation of the word under the cursor if there's only one, otherwise show all options in `telescope`"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				key_opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", key_opts)
			end,
		})
		for type, icon in pairs(opts.signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Used to enable autocompletion (assign to every LSP server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			-- default handler for installed servers
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
