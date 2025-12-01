local conform = require("conform")
require("conform").setup({
	formatters = {
		biome = { require_cwd = true },
		prettier = { require_cwd = true },
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "ruff_format" },
		yaml = { "biome", "prettier" },
		json = { "biome", "prettier" },
		jsonc = { "biome", "prettier" },
		javascript = { "biome", "prettier" },
		typescript = { "biome", "prettier", "deno_fmt", stop_after_first = true },
		typescriptreact = { "biome", "prettier" },
		svelte = { "biome", "prettier" },
		astro = { "biome", "prettier" },
		html = { "biome", "prettier" },
		css = { "biome", "prettier" },
		markdown = { "biome", "prettier" },
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
