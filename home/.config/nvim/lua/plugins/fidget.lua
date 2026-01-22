return {
	"j-hui/fidget.nvim",
	event = "BufEnter",
	config = function()
		require("fidget").setup({
			notification = {
				window = { winblend = 100 },
			},
			progress = {
				display = { progress_icon = { "dots_negative" } },
			},
		})
	end,
}
