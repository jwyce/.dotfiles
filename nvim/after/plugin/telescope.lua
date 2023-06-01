local builtin = require('telescope.builtin')
local media = require("telescope")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pm', media.extensions.media_files.media_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>vrc', function()
    require('jwyce.telescope').search_dotfiles()
end)
vim.keymap.set('n', '<leader>va', function()
    require('jwyce.telescope').anime_selector()
end)

