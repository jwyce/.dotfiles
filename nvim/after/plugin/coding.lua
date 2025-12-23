vim.keymap.set("n", "<leader>lg", ":LazyGit<cr>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n", "x" }, "<leader>sR", function()
	require("ssr").open()
end)
vim.keymap.set("n", "<leader>gf", ":GrugFar<cr>")

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.keymap.set("n", "<leader>lsp", ":LspRestart<cr>")

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

require("zen-mode").setup({
	window = {
		width = 90,
		options = {
			number = true,
			relativenumber = true,
		},
	},
})

require("cloak").setup({
	enabled = true,
	patterns = {
		{
			file_pattern = "*.*env*",
			cloak_pattern = "=.+",
		},
	},
})

vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
	ColorMyPencils()
end)
