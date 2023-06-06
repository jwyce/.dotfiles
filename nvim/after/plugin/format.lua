vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_enabled_javascript = { "prettier", "prettiereslint", "denofmt" }
vim.g.neoformat_enabled_json = { "prettier", "prettiereslint", "denofmt" }
vim.keymap.set("n", "<leader>f", function() vim.cmd("Neoformat") end)
