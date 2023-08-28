return {
  "SmiteshP/nvim-navic",
  lazy = true,
  init = function()
    Util = require("util")
    vim.g.navic_silence = true
    Util.on_attach(function(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer)
      end
    end)
  end,
  opts = function()
    return {
      separator = " ",
      highlight = true,
      depth_limit = 5,
      icons = Util.icons.kinds,
    }
  end,
}
