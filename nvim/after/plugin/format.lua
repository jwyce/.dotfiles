vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_enabled_javascript = { "prettier", "prettier-eslint", "deno fmt" }
vim.g.neoformat_enabled_json = { "prettier", "prettier-eslint", "deno fmt" }
vim.keymap.set("n", "<leader>nf", function() vim.cmd("Neoformat") end)
