local augend = require("dial.augend")
require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"],
		augend.constant.alias.bool,
		augend.semver.alias.semver,
		augend.constant.new({ elements = { "let", "const" } }),
	},
})

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
