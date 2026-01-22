return {
	cmd = { "deno", "lsp" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = function(_, callback)
		local root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" })

		if root_dir then
			callback(root_dir)
		end
	end,
}
