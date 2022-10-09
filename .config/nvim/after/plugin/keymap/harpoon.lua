local nnoremap = require("jwyce.keymap").nnoremap

local silent = { silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader-J>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader-K>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader-L>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader-;>", function() require("harpoon.ui").nav_file(4) end, silent)
