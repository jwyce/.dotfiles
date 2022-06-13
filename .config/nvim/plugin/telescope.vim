lua require("jwyce")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('jwyce.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>va :lua require('jwyce.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('jwyce.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('jwyce.telescope').git_branches()<CR>
nnoremap <leader>td :lua require('jwyce.telescope').dev()<CR>
