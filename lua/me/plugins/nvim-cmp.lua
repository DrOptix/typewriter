return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Source for text in buffer
		"hrsh7th/cmp-path", -- Source for file paths
		"hrsh7th/cmp-cmdline", -- Source for command line completion
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			mapping = cmp.mapping.preset.insert({
				-- Move to the previous completion suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(),

				-- Move to the next completion suggestion
				["<C-j>"] = cmp.mapping.select_next_item(),

				-- Scroll up in the documentation preview (4 lines)
				["<C-b>"] = cmp.mapping.scroll_docs(-4),

				-- Scroll down in the documentation preview (4 lines)
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Trigger the completion suggestions popup
				["<C-Space>"] = cmp.mapping.complete(),

				-- Close the completion window without confirming a selection
				["<C-e>"] = cmp.mapping.abort(),

				-- Confirm the selected completion item (if any) or the current one
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- Sources for autocompletion
			sources = cmp.config.sources({
                -- LSP completion
				{ name = "nvim_lsp" },
				-- Text within current buffer
				{ name = "buffer" },
				-- File paths
				{ name = "path", option = { trailing_slash = true, include_hidden = true } },
			}),
		})

		-- Setup cmdline completion for `:` (command)
		cmp.setup.cmdline(":", {
			sources = {
				{ name = "cmdline" },
				{ name = "path" },
			},
		})

		-- Setup cmdline completion for `/` (search)
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}
