return {
  -- github.com/lukas-reineke/indent-blankline.nvim
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = {
        "alpha",
        "checkhealth",
        "dashboard",
        "help",
        "lazy",
        "lspinfo",
        "man",
        "NvimTree",
        "notify",
        "Trouble",
        "",
      },
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    Snacks.toggle({
      name = "Indentation Guides",
      get = function()
        return require("ibl.config").get_config(0).enabled
      end,
      set = function(state)
        require("ibl").setup_buffer(0, { enabled = state })
      end,
    }):map("<leader>ug")
  end,
}
