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
	-- shared dependencies
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	-- crucial
	"nvim-telescope/telescope.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"theprimeagen/harpoon",
	{ "stevearc/oil.nvim", opts = {} },
	"stevearc/conform.nvim",
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

	-- color themes
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },

	-- language support
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",

	-- debugging
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"theHamsta/nvim-dap-virtual-text",

	--sql
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	{
		"kristijanhusak/vim-dadbod-ui",
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	-- actually useful
	"kdheepak/lazygit.nvim",
	"tpope/vim-fugitive",
	"mbbill/undotree",
	"theprimeagen/git-worktree.nvim",
	{ "theprimeagen/refactoring.nvim", opts = {} },
	{ "dmmulroy/ts-error-translator.nvim", opts = {} },
	{ "folke/todo-comments.nvim", opts = {} },
	"folke/trouble.nvim",
	"numToStr/Comment.nvim",
	{ "MagicDuck/grug-far.nvim", opts = {} },
	"3rd/image.nvim",
	"laytan/cloak.nvim",

	-- cosmetic
	"nvim-lualine/lualine.nvim",
	"j-hui/fidget.nvim",
	"folke/zen-mode.nvim",
	"eandrju/cellular-automaton.nvim",
	"sindrets/diffview.nvim",
	"andweeb/presence.nvim",
	"jwyce/telescope-media-files.nvim",

	-- trying it out
	"zbirenbaum/copilot.lua",
	"monaqa/dial.nvim",
	"cshuaimin/ssr.nvim",
	{ "toppair/peek.nvim", build = "deno task --quiet build:fast", opts = {} },

	-- misc
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{ "ruifm/gitlinker.nvim", opts = {} },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	"brenoprata10/nvim-highlight-colors",
	"princejoogie/tailwind-highlight.nvim",
	"roobert/tailwindcss-colorizer-cmp.nvim",
	{
		"theprimeagen/vim-apm",
		config = function()
			local apm = require("vim-apm")

			apm:setup({})
			vim.keymap.set("n", "<leader>apm", function()
				apm:toggle_monitor()
			end)
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "omoi",
					path = "~/omoi",
				},
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
