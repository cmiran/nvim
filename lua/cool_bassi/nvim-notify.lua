local notify = require("notify")

local get_notification_height = function(win)
  local buf = vim.api.nvim_win_get_buf(win)
  local height = 0

  for _, content in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    local length = string.len(content)

    if length > 0 then
      height = height + math.ceil(string.len(content) / 60)
    else
      height = height + 1
    end
  end

  return height
end

notify.setup({
	-- background_colour = vim.g.palette.bg0,
	fps = 60,
  max_width = 60,
  minimum_width = 60,
	on_open = function(win)
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_set_option(win, "wrap", true)
			vim.api.nvim_win_set_config(win, {
				border = "solid",
        height = get_notification_height(win),
			})
		end
	end,
	render = "compact",
	stages = "fade_in_slide_out",
	timeout = 200,
})

vim.notify = notify
