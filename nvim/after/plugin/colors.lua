local hi = require("nvim-highlight-colors")
vim.keymap.set("n", "cmp", hi.toggle)
require("kanagawa").setup({
	transparent = true,
	theme = "wave", -- wave, dragon, lotus
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
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	no_italic = true,
	transparent_background = true,
	styles = {
		comments = { "italic" },
	},
})
require("tokyonight").setup({
	style = "night", -- storm, night, moon
	transparent = true,
	styles = {
		keywords = { italic = false },
		floats = "transparent",
	},
})
require("rose-pine").setup({
	dark_variant = "main", -- main, moon
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.opt.background = "dark"

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#5eacd3" })
	vim.api.nvim_set_hl(0, "netrwDir", { fg = "#5eacd3" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555", ctermbg = "none" })
end

ColorMyPencils()
