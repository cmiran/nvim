return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetype = {
      yaml = true,
      markdown = true,
    }
  },
}
