return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			patterns = {
				{
					file_pattern = "*.*env*",
					cloak_pattern = "=.+",
				},
			},
		})
	end,
}
