" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>J :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>K :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>L :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>: :lua require("harpoon.ui").nav_file(4)<CR>

