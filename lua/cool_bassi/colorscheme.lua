require("nightfox").setup {
  groups = {
    all = {
      ColorColumn = { link = "CursorLine" },
      -- EndOfBuffer = { fg = "bg1" },
      FloatBorder = { bg = "bg0" },
      IlluminateIlluminate = { bg = '#222F41' },
      IlluminatedWordRead = { bg = '#222F41' },
      IlluminatedWordWrite = { bg = '#222F41' },
      IndentBlanklineChar = { link = "Whitespace" },
      IndentBlanklineSpaceChar = { link = "Whitespace" },
      IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },
      IndentBlanklineContextChar = { link = "Label" },
      IndentBlanklineContextSpaceChar = { link = "Label" },
      IndentBlanklineContextStart = { link = "Label" },
      LspFloatWinBorder = { fg = "bg0" },
      -- NotifyBackground = { bg = "bg0", fg = "bg0" },
      NotifyERRORBody = { bg = "bg0" },
      NotifyWARNBody = { bg = "bg0" },
      NotifyINFOBody = { bg = "bg0" },
      NotifyDEBUGBody = { bg = "bg0" },
      NotifyTRACEBody = { bg = "bg0" },
      NotifyERRORBorder = { bg = "bg0" },
      NotifyWARNBorder = { bg = "bg0" },
      NotifyINFOBorder = { bg = "bg0" },
      NotifyDEBUGBorder = { bg = "bg0" },
      NotifyTRACEBorder = { bg = "bg0" },
      -- NvimTreeEndOfBuffer = { fg = "bg0" },
      NvimTreeWinSeparator = { bg = "bg1", fg = "bg1" },
      -- SpecialKey = { fg = "#FF0000" },
      TelescopeBorder = { bg = "bg0", fg = "bg0" },
      TelescopeNormal = { bg = "bg0" },
      -- WhichKey = { bg = "bg2" },
    },
  },
}

vim.cmd("colorscheme nightfox")
vim.g.palette = require("nightfox.palette").load("nightfox")
