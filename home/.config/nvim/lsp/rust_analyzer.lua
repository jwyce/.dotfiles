return {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.lock" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
				external = {
					enable = true,
				},
				previewRustcOutput = true,
				useRustcErrorCode = true,
			},
		},
	},
}
