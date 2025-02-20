return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	keys = function()
		local dap = require("dap")

		return {
			{
				"<F5>",
				function()
					dap.continue()
				end,
				desc = "Start/Coninue binary debugging",
			},
			{
				"<F10>",
				function()
					dap.step_over()
				end,
				desc = "Step over function",
			},
			{
				"<F11>",
				function()
					dap.step_into()
				end,
				desc = "Step into function",
			},
			{
				"<C-F11>",
				function()
					dap.step_out()
				end,
				desc = "Step out of current function",
			},
			{
				"<LEADER>b",
				function()
					dap.toggle_breakpoint()
				end,
				desc = "Add/Remove breakpoint on current line",
			},
			{
				"<LEADER>B",
				function()
					dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Set conditional breakpoint on current line",
			},
			{
				"<LEADER>bl",
				function()
					dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set log point breakpoint on current line",
			},
			{
				"<LEADER>dr",
				function()
					dap.repl_open()
				end,
				desc = "Open the REPL console of the underling debugger",
			},
		}
	end,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
