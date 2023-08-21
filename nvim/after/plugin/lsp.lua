local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
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

local dict = require("cmp_dictionary")

dict.setup({
	exact = 3,
	first_case_insensitive = false,
	document = false,
	document_command = "wn %s -over",
	async = false,
	max_items = -1,
	capacity = 5,
	debug = false,
})
dict.switcher({
	spelllang = {
		en = "~/.dotfiles/en.dict",
	},
	filepath = {
		["*"] = "~/.dotfiles/en.dict",
	},
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lua' },
    {
      name = "dictionary",
      keyword_length = 2,
    },
  },
  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter
  }
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

lsp.configure('rust_analyzer', {
  diagnostics = {
    external = {
      enable = true,
    },
    previewRustcOutput = true,
    useRustcErrorCode = true,
  },
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
  ),
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)",  "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "tw\\(([^)]*)\\)",   "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
    },
  },
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local tw_highlight = require('tailwind-highlight')

  tw_highlight.setup(client, bufnr, {
    single_column = false,
    mode = 'background',
    debounce = 200,
  })

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
