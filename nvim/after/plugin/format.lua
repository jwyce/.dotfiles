local conform = require("conform")
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "ruff_format" },
		json = { "prettier" },
		javascript = { "prettier" },
		typescript = { { "prettier", "deno_fmt" } },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		astro = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		ocaml = { "ocamlformat" },
		["_"] = { "trim_whitespace" },
	},
})
vim.keymap.set("n", "<leader>f", function()
	conform.format({ async = true, lsp_format = "fallback" })
end)
