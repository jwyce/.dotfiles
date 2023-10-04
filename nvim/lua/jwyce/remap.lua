vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "$")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>P", "\"+p")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "x" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({ "n", "x" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- spell check toggle
-- z= is the spell check suggestion menu
-- zg adds the word to the dictionary
-- ]s and [s jump to the next and previous misspelled word
vim.keymap.set("n", "<leader>sc", "<cmd>set spell!<CR>");

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/jwyce/lazy.lua<CR>");
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
