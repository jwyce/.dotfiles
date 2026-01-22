return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"ts_ls",
						"eslint",
						"lua_ls",
						"rust_analyzer",
					},
				},
			},
		},
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					vim.keymap.set("i", "<c-e>", function()
						vim.lsp.completion.get()
					end)
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end)
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end)
				end,
			})

			vim.o.winborder = "rounded"

			-- FIXME: remove after https://github.com/nvim-telescope/telescope.nvim/issues/3436
			vim.api.nvim_create_autocmd("User", {
				pattern = "TelescopeFindPre",
				callback = function()
					vim.opt_local.winborder = "none"
					vim.api.nvim_create_autocmd("WinLeave", {
						once = true,
						callback = function()
							vim.opt_local.winborder = "rounded"
						end,
					})
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
}
