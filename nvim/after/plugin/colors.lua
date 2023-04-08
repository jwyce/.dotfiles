local hi = require("nvim-highlight-colors")
vim.keymap.set("n", "cmp", hi.toggle)

function ColorMyPencils(color)
  require("tokyonight").setup({
    style = "night",
  })

  color = color or "catppuccin"
  vim.cmd.colorscheme(color)
  vim.opt.background = "dark"

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#5eacd3" })
  vim.api.nvim_set_hl(0, "netrwDir", { fg = "#5eacd3" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555", ctermbg = "none" })
end

ColorMyPencils()
