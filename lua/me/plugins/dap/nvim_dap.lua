local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local function pick_process()
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
						local selection = action_state.get_selected_entry()[1]
						local pid = tonumber(selection:match("(%d+)"))
						coroutine.resume(co, pid)
					end)
					return true
				end,
			})
			:find()
	end)
end

local function pick_binary()
	-- TODO get the file type and pick the correct build command and the correct\
	-- finder according to the file type
	local build_cmd = {
		cs = "dotnet build -c Debug",
		rust = "cargo build",
	}

	local finder_cmd = {
		cs = { "find", ".", "-type", "f", "-path", "*.dll" },
		rust = {
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
		},
	}

	local file_type = vim.bo.filetype

	os.execute(build_cmd[file_type])

	return coroutine.create(function(co)
		local opts = {}
		pickers
			.new(opts, {
				prompt_title = "Launch",
				finder = finders.new_oneshot_job(finder_cmd[file_type], {}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(buffer_number)
					actions.select_default:replace(function()
						actions.close(buffer_number)
						local file_path = "${workspaceFolder}/" .. action_state.get_selected_entry()[1]
						coroutine.resume(co, file_path)
					end)
					return true
				end,
			})
			:find()
	end)
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = function()
		local dap = require("dap")

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
				program = pick_binary,
			},
			{
				type = "coreclr",
				name = "[DAP dotnet] Attach to process",
				request = "attach",
				processId = pick_process,
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
				program = pick_binary,
			},
			{
				type = "codelldb",
				name = "[DAP codelldb] Attach to process",
				request = "attach",
				pid = pick_process,
			},
		}
	end,
	config = function() end,
}
