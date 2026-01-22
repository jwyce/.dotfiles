return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters = {
				oxfmt = { require_cwd = true },
				biome = { require_cwd = true },
				prettier = { require_cwd = true },
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "ruff_format" },
				yaml = { "oxfmt", "biome", "prettier", stop_after_first = true },
				json = { "oxfmt", "biome", "prettier", stop_after_first = true },
				jsonc = { "oxfmt", "biome", "prettier", stop_after_first = true },
				javascript = { "oxfmt", "biome", "prettier", stop_after_first = true },
				typescript = { "oxfmt", "biome", "prettier", "deno_fmt", stop_after_first = true },
				typescriptreact = { "oxfmt", "biome", "prettier", stop_after_first = true },
				svelte = { "oxfmt", "biome", "prettier", stop_after_first = true },
				astro = { "oxfmt", "biome", "prettier", stop_after_first = true },
				html = { "oxfmt", "biome", "prettier", stop_after_first = true },
				css = { "oxfmt", "biome", "prettier", stop_after_first = true },
				markdown = { "oxfmt", "biome", "prettier", stop_after_first = true },
				go = { "gofmt" },
				rust = { "rustfmt" },
				elixir = { "mix" },
				ocaml = { "ocamlformat" },
				["_"] = { "trim_whitespace" },
			},
		})
		vim.keymap.set("n", "<leader>f", function()
			conform.format({ async = true, lsp_format = "fallback" })
		end)
	end,
}
