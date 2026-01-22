return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
		{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (repo)" },
	},
	opts = {
		enhanced_diff_hl = true,
		file_panel = {
			listing_style = "tree",
			win_config = { position = "left", width = 35 },
		},
	},
}
