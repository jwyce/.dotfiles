require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "show" },
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
