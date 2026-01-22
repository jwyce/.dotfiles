return {
	{ "tpope/vim-fugitive" },
	{ "ruifm/gitlinker.nvim", opts = {} },
	{
		"swaits/lazyjj.nvim",
		opts = {},
		config = function()
			require("lazyjj").setup({})
			vim.keymap.set("n", "<leader>jj", ":LazyJJ<cr>")
		end,
	},
}
