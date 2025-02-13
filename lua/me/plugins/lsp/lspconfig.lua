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

				key_opts.desc =
					"Goto the implementation of the word under the cursor if there's only one, otherwise show all options in `telescope`"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", key_opts)

				key_opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", key_opts)

				key_opts.desc = "Show documentation for the symbol under cursor"
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, key_opts)

				key_opts.desc = "Display signature help"
				vim.keymap.set("n", "<LEADER>K", function()
					vim.lsp.buf.signature_help()
				end, key_opts)

				key_opts.desc = "Format the current buffer"
				vim.keymap.set("n", "<LEADER>f", function()
					vim.lsp.buf.formatting()
				end, key_opts)
			end,
		})

		for type, icon in pairs(opts.signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Used to enable autocompletion (assign to every LSP server config)
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["omnisharp"] = function()
				lspconfig["omnisharp"].setup({
					capabilities = capabilities,
					cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/omnisharp") },
					enable_roslyn_analyzers = true,
					organize_imports_on_format = true,
					enable_import_completion = true,
				})
			end,

			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- Make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								-- Make language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,

			["rust_analyzer"] = function()
				lspconfig["rust_analyzer"].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
