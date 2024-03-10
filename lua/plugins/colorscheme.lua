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
        FloatBorder = { bg = "bg0", fg = "bg0" },
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
        -- NvimTreeWinSeparator = { bg = "bg1", fg = "bg1" },
        TelescopeNormal = { bg = "bg0" },
        TelescopeBorder = { bg = "bg0", fg = "bg0" },
      },
    },
  },
  init = function()
    vim.g.palette = require("nightfox.palette").load("nightfox")
  end,
}
