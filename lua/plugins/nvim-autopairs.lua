-- Autopairs, integrates with both cmp and treesitter
-- github.com/windwp/nvim-autopairs
return {
  "windwp/nvim-autopairs",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = {
      "alpha",
      "help",
      "spectre_panel",
      "TelescopePrompt",
    },
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        autopairs = {
          enable = true,
        },
      },
    },
  },
}
