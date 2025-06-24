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
		menu = {
			draw = {
				components = {
					kind_icon = {
						ellipsis = false,
						highlight = function(ctx)
							local hl = "BlinkCmpKind" .. ctx.kind
								or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
							end

							return icon .. ctx.icon_gap
						end,
					},
				},
			},
		},
	},

	sources = {
		default = { "lsp", "path", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
