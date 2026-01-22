return {
	cmd = { "mdx-language-server", "--stdio" },
	filetypes = { "mdx" },
	root_markers = { "package.json" },
	init_options = {
		typescript = {
			enabled = true,
		},
	},
	before_init = function(_, config)
		local root_dir = config.root_dir
		if root_dir then
			local tsdk = root_dir .. "/node_modules/typescript/lib"
			if vim.fn.isdirectory(tsdk) == 1 then
				config.init_options.typescript.tsdk = tsdk
			end
		end
	end,
}
