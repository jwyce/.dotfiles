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

vim.keymap.set("n", "<leader>tt", ":TroubleToggle workspace_diagnostics<cr>")
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<Tab>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = { ["*"] = true },
})

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
