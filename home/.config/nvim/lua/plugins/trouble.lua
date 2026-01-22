return {
	{
		"folke/trouble.nvim",
		opts = {},
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
			vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")
		end,
	},
	{ "folke/todo-comments.nvim", opts = {} },
}
