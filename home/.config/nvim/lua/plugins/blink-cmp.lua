return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts_extend = { "sources.default" },
		config = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["<CR>"] = { "accept", "fallback" },
					["<C-e>"] = { "show" },
					["<C-o>"] = { "hide" },
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = { auto_show = true },
				},

				sources = {
					default = { "lsp", "path", "buffer" },
				},

				fuzzy = { implementation = "prefer_rust_with_warning" },
			})
		end,
	},
	{ "onsails/lspkind.nvim" },
}
