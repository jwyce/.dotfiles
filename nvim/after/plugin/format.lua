local conform = require("conform")
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		json = { "prettier" },
		javascript = { "prettier" },
		typescript = { { "prettier", "deno_fmt" } },
		typescriptreact = { "prettier" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		ocaml = { "ocamlformat" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},
})
vim.keymap.set("n", "<leader>f", conform.format)
