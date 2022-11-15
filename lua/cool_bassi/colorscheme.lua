local status_ok, nightfox = pcall(require, 'nightfox')
if not status_ok then
  return
end

nightfox.setup {
  groups = {
    all = {
      ColorColumn = { link = "CursorLine" },
      EndOfBuffer = { fg = "bg1" },
      FloatBorder = { bg = "bg0" },
      LspFloatWinBorder = { fg = "bg0" },
      NvimTreeEndOfBuffer = { fg = "bg0" },
      NvimTreeWinSeparator = { bg = "bg1", fg = "bg1" },
      TelescopeBorder = { bg = "bg0", fg = "bg0" },
      TelescopeNormal = { bg = "bg0" },
      WinSeparator = { fg = "bg1" },
      -- WhichKey = { bg = "bg2" },
    },
  },
}

vim.cmd "colorscheme nightfox"
vim.g.palette = require("nightfox.palette").load("nightfox") 

