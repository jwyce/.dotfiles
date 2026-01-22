return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000, style = "fancy" },
		rename = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Buffer delete",
		},
		{
			"<leader>og",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open in GitHub",
		},
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>td",
			function()
				Snacks.toggle.diagnostics():toggle()
			end,
			desc = "Toggle diagnostics",
		},
	},
}
