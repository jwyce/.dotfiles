local conform = require("conform")
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "ruff_format" },
		yaml = { "prettier" },
		json = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier", "deno_fmt", stop_after_first = true },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		astro = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
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
