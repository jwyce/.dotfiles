local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "svg", "pdf" },
			find_cmd = "rg",
		},
	},
})

require("telescope").load_extension("media_files")
require("telescope").load_extension("git_worktree")

local M = {}

function M.reload_modules()
	-- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
	-- awesome things.
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

local function set_background(content)
	vim.fn.system("echo " .. content.. " | pbcopy")
	vim.fn.system("wallpaper " .. content)
end

local function select_background(prompt_bufnr, map, cwd)
	map("i", "<CR>", function()
		local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
		set_background(cwd .. string.sub(content.value, 2))
		require("telescope.actions").close(prompt_bufnr)
	end)
end

local function image_selector(prompt, cwd)
	return function()
		require("telescope").extensions.media_files.media_files({
			prompt_title = prompt,
			cwd = cwd,
			attach_mappings = function(prompt_bufnr, map)
				select_background(prompt_bufnr, map, cwd)

				-- Please continue mapping (attaching additional key maps):
				-- Ctrl+n/p to move up and down the list.
				return true
			end,
		})
	end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/dev/personal/anime")

return M
