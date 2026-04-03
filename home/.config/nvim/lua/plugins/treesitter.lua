return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			local parsers = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" }
			local installed = {}

			for _, parser in ipairs(treesitter.get_installed()) do
				installed[parser] = true
			end

			vim.g.skip_ts_context_commentstring_module = true
			vim.treesitter.language.register("markdown", "mdx")

			treesitter.setup({})

			local missing = vim.tbl_filter(function(parser)
				return not installed[parser]
			end, parsers)

			if #missing > 0 then
				treesitter.install(missing)
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if vim.bo[args.buf].buftype ~= "" then
						return
					end

					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
