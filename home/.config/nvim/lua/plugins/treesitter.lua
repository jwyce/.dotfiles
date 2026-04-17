return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			local parsers = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" }
			local available = {}
			local pending = {}
			local waiting = {}

			for _, parser in ipairs(treesitter.get_available()) do
				available[parser] = true
			end

			local function is_installed(parser)
				return vim.list_contains(treesitter.get_installed(), parser)
			end

			local function start(buf, parser)
				if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
					return
				end

				if parser then
					local ok = vim.treesitter.language.add(parser)
					if not ok then
						return
					end
				end

				vim.treesitter.stop(buf)
				pcall(vim.treesitter.start, buf, parser)
			end

			local function ensure_installed(parser, buf)
				if not parser or not available[parser] then
					return
				end

				if is_installed(parser) then
					start(buf, parser)
					return
				end

				waiting[parser] = waiting[parser] or {}
				waiting[parser][buf] = true
				if pending[parser] then
					return
				end

				pending[parser] = true
				treesitter.install({ parser }):await(function()
					pending[parser] = nil

					vim.schedule(function()
						local bufs = waiting[parser] or {}
						waiting[parser] = nil

						if not is_installed(parser) then
							return
						end

						for waiting_buf in pairs(bufs) do
							start(waiting_buf, parser)
						end
					end)
				end)
			end

			vim.g.skip_ts_context_commentstring_module = true
			vim.treesitter.language.register("markdown", "mdx")

			treesitter.setup({})

			local missing = vim.tbl_filter(function(parser)
				return not is_installed(parser)
			end, parsers)

			if #missing > 0 then
				treesitter.install(missing)
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if vim.bo[args.buf].buftype ~= "" then
						return
					end

					local parser = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					ensure_installed(parser, args.buf)
				end,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
