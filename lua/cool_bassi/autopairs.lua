local autopairs = require("nvim-autopairs")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = {
    "alpha",
    "spectre_panel",
    "TelescopePrompt",
  },
  fast_wrap = {
    map = "<M-e>", -- does not seem's to work
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
