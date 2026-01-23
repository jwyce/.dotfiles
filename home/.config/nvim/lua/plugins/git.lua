return {
	{ "tpope/vim-fugitive" },
	{ "ruifm/gitlinker.nvim", opts = {} },
	{
		"swaits/lazyjj.nvim",
		opts = {},
		config = function()
			require("lazyjj").setup({})

			-- override M.open to use borderless float (lazyjj TUI draws its own)
			local lazyjj = require("lazyjj")
			lazyjj.open = function()
				local cmd = "lazyjj"
				if vim.fn.executable(cmd) ~= 1 then
					vim.notify("lazyjj not found in PATH", vim.log.levels.ERROR)
					return
				end

				local prev_win = vim.api.nvim_get_current_win()
				local buf = vim.api.nvim_create_buf(false, true)
				local win = vim.api.nvim_open_win(buf, true, {
					relative = "editor",
					width = math.floor(vim.o.columns * 0.9),
					height = math.floor(vim.o.lines * 0.8),
					col = math.floor(vim.o.columns * 0.05),
					row = math.floor(vim.o.lines * 0.1),
					style = "minimal",
					border = "rounded",
				})
			vim.api.nvim_set_hl(0, "LazyJJBorder", { fg = "#7aa2f7" })
			vim.wo[win].winhighlight = "FloatBorder:LazyJJBorder"
				vim.bo[buf].filetype = "lazyjj"
				vim.cmd("setlocal bufhidden=hide")
				vim.api.nvim_create_autocmd("WinLeave", {
					buffer = buf,
					callback = function() vim.cmd("hide") end,
					once = true,
				})
				vim.fn.termopen(cmd, {
					on_exit = function()
						if vim.api.nvim_win_is_valid(prev_win) then
							vim.api.nvim_set_current_win(prev_win)
						end
					end,
				})
				vim.cmd("startinsert")
			end

			vim.keymap.set("n", "<leader>jj", lazyjj.open)
		end,
	},
}
