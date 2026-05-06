return {
	"andweeb/presence.nvim",
	config = function()
		local presence = require("presence")

		presence:setup({
			main_image = "file",
		})

		local function is_oil_buffer()
			return vim.bo.filetype == "oil" or vim.api.nvim_buf_get_name(0):match("^oil://") ~= nil
		end

		local group = vim.api.nvim_create_augroup("presence_events", { clear = true })
		vim.api.nvim_create_autocmd("FocusGained", {
			group = group,
			callback = function()
				if not is_oil_buffer() then
					presence:handle_focus_gained()
				end
			end,
		})
		vim.api.nvim_create_autocmd("TextChanged", {
			group = group,
			callback = function()
				if not is_oil_buffer() then
					presence:handle_text_changed()
				end
			end,
		})
		vim.api.nvim_create_autocmd("VimLeavePre", {
			group = group,
			callback = function()
				presence:handle_vim_leave_pre()
			end,
		})
		vim.api.nvim_create_autocmd("WinEnter", {
			group = group,
			callback = function()
				if not is_oil_buffer() then
					presence:handle_win_enter()
				end
			end,
		})
		vim.api.nvim_create_autocmd("WinLeave", {
			group = group,
			callback = function()
				if not is_oil_buffer() then
					presence:handle_win_leave()
				end
			end,
		})
		vim.api.nvim_create_autocmd("BufEnter", {
			group = group,
			callback = function()
				if not is_oil_buffer() then
					presence:handle_buf_enter()
				end
			end,
		})
	end,
}
