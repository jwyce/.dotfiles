return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		local image_preview = require("jwyce.buffer_previewer").setup()

		require("telescope").setup({
			defaults = {
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				prompt_prefix = " >",
				color_devicons = true,

				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				file_previewer = image_preview.file_previewer,
				buffer_previewer_maker = image_preview.buffer_previewer_maker,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

				mappings = {
					i = {
						["<C-x>"] = false,
						["<C-q>"] = actions.send_to_qflist,
					},
				},
			},
			extensions = {
				file_browser = { hijack_netrw = true },
			},
		})

		require("telescope").load_extension("git_worktree")

		local search_dotfiles = function()
			require("telescope.builtin").find_files({
				prompt_title = "< VimRC >",
				cwd = vim.env.DOTFILES,
				hidden = true,
			})
		end

		local function set_background(content)
			vim.fn.system("echo " .. content .. " | pbcopy")
			vim.fn.system("wallpaper " .. content)
		end

		local function select_background(prompt_bufnr, map, cwd)
			map("i", "<CR>", function()
				local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
				set_background(cwd .. "/" .. content.value)
				require("telescope.actions").close(prompt_bufnr)
			end)
		end

		local function image_selector(prompt, cwd)
			return function()
				require("telescope.builtin").find_files({
					prompt_title = prompt,
					cwd = cwd,

					attach_mappings = function(prompt_bufnr, map)
						select_background(prompt_bufnr, map, cwd)
						return true
					end,
				})
			end
		end

		local anime_selector = image_selector("< Anime Bobs > ", "~/dev/personal/anime")

		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

		vim.keymap.set("n", "<leader>gw", telescope.extensions.git_worktree.git_worktrees, {})
		vim.keymap.set("n", "<leader>gm", telescope.extensions.git_worktree.create_git_worktree, {})
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>vb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>vre", builtin.registers, {})
		vim.keymap.set("n", "<leader>vm", builtin.marks, {})
		vim.keymap.set("n", "<leader>vrc", function()
			search_dotfiles()
		end)
		vim.keymap.set("n", "<leader>va", function()
			anime_selector()
		end)
	end,
}
