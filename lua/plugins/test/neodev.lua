return {
  "folke/neodev.nvim",
  opts = function(_, opts)
    opts.library = { plugins = { "neotest" }, types = true }
    return opts
  end,
}
