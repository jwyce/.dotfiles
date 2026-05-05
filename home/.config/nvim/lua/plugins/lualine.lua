return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "theprimeagen/harpoon" },
		config = function()
			local harpoon = require("harpoon")

			local function truncate_branch_name(branch)
				if not branch or branch == "" then
					return ""
				end

				-- Match the branch name to the specified format
				local user, team, ticket_number = string.match(branch, "^(%w+)/(%w+)%-(%d+)")

				-- If the branch name matches the format, display {user}/{team}-{ticket_number}, otherwise display the full branch name
				if ticket_number then
					return user .. "/" .. team .. "-" .. ticket_number
				else
					return branch
				end
			end

			local vcs_cache = { result = nil, cwd = nil, pending = false }

			local function set_vcs_cache(cwd, result)
				vim.schedule(function()
					if vcs_cache.cwd ~= cwd then
						return
					end

					vcs_cache = { result = result, cwd = cwd, pending = false }
					vim.cmd.redrawstatus()
				end)
			end

			local function refresh_vcs_info(cwd)
				if vcs_cache.pending then
					return
				end

				vcs_cache = { result = vcs_cache.result, cwd = cwd, pending = true }

				vim.system({ "jj", "root" }, { text = true }, function(root_result)
					if root_result.code == 0 then
						vim.system({ "jj", "log", "-r", "@", "--no-graph", "-T", "bookmarks" }, { text = true }, function(bookmark_result)
							local bookmark = (bookmark_result.stdout or ""):gsub("%s+$", "")
							if bookmark ~= "" then
								local first = bookmark:match("^(%S+)") or bookmark
								set_vcs_cache(cwd, truncate_branch_name(first))
								return
							end

							vim.system({ "jj", "log", "-r", "@", "--no-graph", "-T", "change_id.shortest(8)" }, { text = true }, function(change_result)
								set_vcs_cache(cwd, (change_result.stdout or ""):gsub("%s+$", ""))
							end)
						end)
						return
					end

					vim.system({ "git", "branch", "--show-current" }, { text = true }, function(branch_result)
						local branch = (branch_result.stdout or ""):gsub("%s+$", "")
						if branch_result.code == 0 and branch ~= "" then
							set_vcs_cache(cwd, truncate_branch_name(branch))
						else
							set_vcs_cache(cwd, "")
						end
					end)
				end)
			end

			local function get_vcs_info()
				local cwd = vim.fn.getcwd()
				if vcs_cache.cwd == cwd and vcs_cache.result then
					return vcs_cache.result
				end

				refresh_vcs_info(cwd)
				return vcs_cache.result or ""
			end

			vim.api.nvim_create_autocmd({ "DirChanged", "FocusGained" }, {
				callback = function()
					vcs_cache = { result = nil, cwd = nil, pending = false }
				end,
			})

			local function harpoon_component()
				local list = harpoon:list()
				local total_marks = list:length()

				if total_marks == 0 then
					return ""
				end

				local current_mark = "—"
				local current_file = vim.fn.expand("%:p:.")

				for idx, item in ipairs(list.items) do
					if item.value == current_file then
						current_mark = tostring(idx)
						break
					end
				end

				return string.format("󱡅 %s/%d", current_mark, total_marks)
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "█", right = "█" },
				},
				sections = {
					lualine_b = {
						{ get_vcs_info, icon = "" },
						harpoon_component,
						{
							"diff",
							source = function()
								local bufnr = vim.api.nvim_get_current_buf()
								local summary = vim.b[bufnr].vcsigns_summary
								if summary then
									return {
										added = summary.added or 0,
										modified = summary.modified or 0,
										removed = summary.removed or 0,
									}
								end
								return nil
							end,
						},
						"diagnostics",
					},
					lualine_c = {
						{ "filename", path = 1 },
					},
					lualine_x = {
						"filetype",
					},
				},
			})
		end,
	},
}
