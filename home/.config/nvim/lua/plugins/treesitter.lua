return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			vim.g.skip_ts_context_commentstring_module = true
			vim.treesitter.language.register("markdown", "mdx")

			require("nvim-treesitter.configs").setup({
				ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/playground" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
