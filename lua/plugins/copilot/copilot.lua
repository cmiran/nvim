return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      auto_trigger = true, -- Suggest as we start typing
      enabled = false,
    },
    panel = {
      enabled = false,
    },
    filetype = {
      yaml = true,
      markdown = true,
    },
  },
}
