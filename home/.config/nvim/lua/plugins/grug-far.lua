return {
	"MagicDuck/grug-far.nvim",
	opts = {},
	config = function()
		require("grug-far").setup({})
		vim.keymap.set("n", "<leader>gf", ":GrugFar<cr>")
	end,
}
