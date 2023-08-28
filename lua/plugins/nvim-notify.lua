local get_notification_height = function(win)
  local buf = vim.api.nvim_win_get_buf(win)
  local height = 0

  for _, content in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    local length = string.len(content)
    if length > 0 then
      height = height + math.ceil(string.len(content) / math.floor(vim.o.columns * 0.42))
    else
      height = height + 1
    end
  end

  return height
end

return {
  "rcarriga/nvim-notify",
  dependencies = {
    -- github.com/folke/noice.nvim
    "folke/noice.nvim",
  },
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "clear notifications",
    },
  },
  opts = {
    fps = 90,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.42)
    end,
    minimum_width = 5,
    on_open = function(win)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_option(win, "wrap", true)
        vim.api.nvim_win_set_config(win, {
          -- border = "solid",
          height = get_notification_height(win),
        })
      end
    end,
    render = "compact",
    stages = "fade_in_slide_out",
    timeout = 300,
  },
  init = function()
    vim.notify = require("notify")
  end,
}
