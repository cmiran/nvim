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
    -- fast_wrap = {
    --   map = "<M-e>", -- does not seem's to work
    --   chars = { "{", "[", "(", '"', "'" },
    --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    --   offset = 0, -- Offset from pattern match
    --   end_key = "$",
    --   before_key = 'h',
    --   after_key = 'l',
    --   cursor_pos_before = true,
    --   keys = "qwertyuiopzxcvbnmasdfghjkl",
    --   check_comma = true,
    --   highlight = "PmenuSel",
    --   highlight_grey = "LineNr",
    -- },
    fast_wrap = {},
  },
}
