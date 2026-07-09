return {
	cmd = { "tsgo", "--lsp", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = function(bufnr, callback)
		local deno_dir = vim.fs.root(bufnr, { "deno.json", "deno.jsonc", "deno.lock" })
		local root_dir = vim.fs.root(bufnr, { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", ".git" })

		if deno_dir == nil then
			callback(root_dir or vim.fn.getcwd())
		end
	end,
}
