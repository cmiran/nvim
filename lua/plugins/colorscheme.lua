-- github.com/EdenEast/nightfox.nvim
return {
  "EdenEast/nightfox.nvim",
  lazy = true,
  priority = 1000,
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd([[colorscheme nightfox]])
  end,
  opts = {
    transparent = true,
    groups = {
      all = {
        -- ColorColumn = { link = "CursorLine" },
        -- FloatBorder = { bg = "bg0" },
        -- NotifyBackground = { bg = "bg0", fg = "bg0" },
        NotifyDEBUGBody = { bg = "bg0" },
        NotifyERRORBody = { bg = "bg0" },
        NotifyINFOBody = { bg = "bg0" },
        NotifyTraceBody = { bg = "bg0" },
        NotifyWARNBody = { bg = "bg0" },
        NotifyDEBUGBorder = { bg = "bg0", fg = "bg0" },
        NotifyERRORBorder = { bg = "bg0", fg = "bg0" },
        NotifyINFOBorder = { bg = "bg0", fg = "bg0" },
        NotifyTraceBorder = { bg = "bg0", fg = "bg0" },
        NotifyWARNBorder = { bg = "bg0", fg = "bg0" },
        NvimTreeWinSeparator = { bg = "bg1", fg = "bg1" },
        TelescopeNormal = { bg = "bg0" },
        TelescopeBorder = { bg = "bg0", fg = "bg0" },
        -- IlluminateIlluminate = { bg = '#222F41' },
        -- IlluminatedWordRead = { bg = '#222F41' },
        -- IlluminatedWordWrite = { bg = '#222F41' },
        -- IndentBlanklineChar = { link = "Whitespace" },
        -- IndentBlanklineSpaceChar = { link = "Whitespace" },
        -- IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },
        -- IndentBlanklineContextChar = { link = "Label" },
        -- IndentBlanklineContextSpaceChar = { link = "Label" },
        -- IndentBlanklineContextStart = { link = "Label" },
        -- LspFloatWinBorder = { fg = "bg0" },
        -- WhichKey = { bg = "bg2" },
      },
    },
  },
  init = function()
    vim.g.palette = require("nightfox.palette").load("nightfox")
  end
}
