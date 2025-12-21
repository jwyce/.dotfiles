local hi = require("nvim-highlight-colors")
vim.keymap.set("n", "cmp", hi.toggle)
require("kanagawa").setup({
	transparent = true,
	theme = "wave",
	keywordStyle = { italic = false },
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})
require("gruvbox").setup({
	italic = {
		strings = false,
		comments = true,
		operators = false,
	},
	inverse = true,
	transparent_mode = true,
})
require("catppuccin").setup({
	flavour = "mocha",
	no_italic = true,
	transparent_background = true,
	styles = {
		comments = { "italic" },
	},
})
require("bearded").setup({
	flavor = "arc-reversed",
	transparent = true,
	italic = false,
	on_highlights = function(set, palette)
		set("Normal", { fg = palette.ui.default })
		set("NormalFloat", { bg = "NONE" })
		set("FloatBorder", { bg = "NONE" })
		set("TelescopeNormal", { bg = "NONE" })
		set("TelescopeBorder", { bg = "NONE" })
		set("TelescopePromptNormal", { bg = "NONE" })
		set("TelescopeResultsNormal", { bg = "NONE" })
		set("TelescopePreviewNormal", { bg = "NONE" })
	end,
})
require("tokyonight").setup({
	style = "moon", -- storm, moon
	transparent = true,
	styles = {
		keywords = { italic = false },
		floats = "transparent",
	},
})
require("rose-pine").setup({
	dark_variant = "main", -- main, moon
	styles = {
		bold = true,
		italic = false,
		transparency = true,
	},
	highlight_groups = {
		OilDir = { fg = "foam" },
		CurSearch = { fg = "base", bg = "rose", inherit = false },
		Search = { fg = "text", bg = "rose", blend = 20, inherit = false },
		Visual = { bg = "#44415a", inherit = false },
	},
})

function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
	vim.opt.background = "dark"

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#5eacd3" })
	vim.api.nvim_set_hl(0, "netrwDir", { fg = "#5eacd3" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555", ctermbg = "none" })
end

ColorMyPencils()
