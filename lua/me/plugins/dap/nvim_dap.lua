return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = function()
		local dap = require("dap")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local conf = require("telescope.config").values

		-- Setup C#
		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.expand("~/.local/share/nvim/mason/bin/netcoredbg"),
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "[DAP dotnet] Launch",
				request = "launch",
				stopAtEntry = false,
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
				},
				cwd = "${workspaceFolder}",
				args = {},
				program = function()
					os.execute("dotnet build -c Debug")

					return coroutine.create(function(co)
						local opts = {}
						pickers
							.new(opts, {
								prompt_title = "Launch",
								finder = finders.new_oneshot_job({ "find", ".", "-type", "f", "-path", "*.dll" }, {}),
								sorter = conf.generic_sorter(opts),
								attach_mappings = function(buffer_number)
									actions.select_default:replace(function()
										actions.close(buffer_number)
										coroutine.resume(
											co,
											"${workspaceFolder}/" .. action_state.get_selected_entry()[1]
										)
									end)
									return true
								end,
							})
							:find()
					end)
				end,
			},
			{
				type = "coreclr",
				name = "[DAP dotnet] Attach to process",
				request = "attach",
				processId = function()
					return coroutine.create(function(co)
						local opts = {}
						local user = vim.fn.trim(vim.fn.system("whoami"))
						pickers
							.new(opts, {
								prompt_title = "Attach to process",
								finder = finders.new_oneshot_job({ "ps", "-U", user, "ah" }, {}),
								sorter = conf.generic_sorter(opts),
								attach_mappings = function(buffer_number)
									actions.select_default:replace(function()
										actions.close(buffer_number)
										coroutine.resume(co, action_state.get_selected_entry()[1])
									end)
									return true
								end,
							})
							:find()
					end)
				end,
			},
		}

		-- Rust
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"),
				args = {
					"--port",
					"${port}",
				},
			},
		}

		dap.configurations.rust = {
			{
				type = "codelldb",
				name = "[DAP codelldb] Launch",
				request = "launch",
				stopAtEntry = false,
				cwd = "${workspaceFolder}",
				args = {},
				program = function()
					os.execute("cargo build")

					return coroutine.create(function(co)
						local opts = {}
						pickers
							.new(opts, {
								prompt_title = "Launch",
								finder = finders.new_oneshot_job({
									"find",
									"./target/debug",
									"-type",
									"d",
									"-name",
									"deps",
									"-prune",
									"-o",
									"-type",
									"f",
									"-executable",
									"-print",
								}, {}),
								sorter = conf.generic_sorter(opts),
								attach_mappings = function(buffer_number)
									actions.select_default:replace(function()
										actions.close(buffer_number)
										coroutine.resume(
											co,
											"${workspaceFolder}/" .. action_state.get_selected_entry()[1]
										)
									end)
									return true
								end,
							})
							:find()
					end)
				end,
			},
		}
	end,
	config = function() end,
}
