return {
	cmd = { "astro-ls", "--stdio" },
	filetypes = { "astro" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
	init_options = {
		typescript = {
			tsdk = (function()
				local root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json" })
				return root_dir and root_dir .. "/node_modules/typescript/lib" or ""
			end)(),
		},
	},
}
