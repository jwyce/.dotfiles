local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim" },
	"jwyce/telescope-media-files.nvim",
	"nvim-tree/nvim-web-devicons",

	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },

	"nvim-treesitter/nvim-treesitter",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",

	"kdheepak/lazygit.nvim",
	"tpope/vim-fugitive",
	"mbbill/undotree",
	"theprimeagen/harpoon",
	"theprimeagen/git-worktree.nvim",
	{ "theprimeagen/refactoring.nvim", opts = {} },
	{ "folke/todo-comments.nvim", opts = {} },
	"folke/trouble.nvim",
	"folke/zen-mode.nvim",

	"eandrju/cellular-automaton.nvim",
	"zbirenbaum/copilot.lua",
	"laytan/cloak.nvim",
	"monaqa/dial.nvim",
	"sindrets/diffview.nvim",
	"andweeb/presence.nvim",
	"cshuaimin/ssr.nvim",
	{ "toppair/peek.nvim", build = "deno task --quiet build:fast", opts = {} },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},

	"nvim-lualine/lualine.nvim",
	{ "stevearc/oil.nvim", opts = {} },
	"stevearc/conform.nvim",
	"numToStr/Comment.nvim",
	{ "ruifm/gitlinker.nvim", opts = {} },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	"brenoprata10/nvim-highlight-colors",
	"princejoogie/tailwind-highlight.nvim",
	"roobert/tailwindcss-colorizer-cmp.nvim",

	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/omoi/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/omoi/**.md",
		},
		opts = {
			dir = "~/omoi",
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
