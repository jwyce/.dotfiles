return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
			vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
			vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
			vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
			vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
			vim.keymap.set(
				"n",
				"<leader>B",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
			)
			vim.keymap.set(
				"n",
				"<leader>lp",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
			)
			vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
		end,
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
			vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")
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
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
