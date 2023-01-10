local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
local root_pattern = require('lspconfig.util').root_pattern

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    },
})

lsp.configure('denols', {
    root_dir = root_pattern(
        'deno.json'
    )
})
lsp.configure('tsserver', {
    commands = {
        OrganizeImports = {
            function()
                vim.lsp.buf.execute_command({
                    command = '_typescript.organizeImports',
                    arguments = { vim.api.nvim_buf_get_name(0) },
                })
            end,
        },
    },
    root_dir = root_pattern(
        'tsconfig.json'
    ),
})
lsp.configure('tailwindcss', {
    root_dir = root_pattern(
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.ts'
    )
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd [[ LspStop eslint ]]
        return
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})