return {
	{
		"NickvanDyke/opencode.nvim",
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {}
			vim.o.autoread = true

			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "[O]pencode [A]sk" })
			vim.keymap.set({ "n", "x" }, "<leader>os", function()
				require("opencode").select()
			end, { desc = "[O]pencode [S]elect action" })
			vim.keymap.set({ "n", "t" }, "<leader>ot", function()
				require("opencode").toggle()
			end, { desc = "[O]pencode [T]oggle" })
			vim.keymap.set({ "n", "x" }, "<leader>oo", function()
				return require("opencode").operator("@this ")
			end, { desc = "[O]pencode [O]perator range", expr = true })
			vim.keymap.set("n", "<leader>ool", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "[O]pencode [O]perator [L]ine", expr = true })
		end,
	},
}
