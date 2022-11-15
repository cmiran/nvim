local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- local lualine_scheme = "nightfox"
-- local status_theme_ok, theme = pcall(require, "lualine.themes." .. lualine_scheme)
-- if not status_theme_ok then
--   return
-- end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- local branch = {
--   function()
--     local gitsigns_buffer_head = vim.b.gitsigns_head

--     if gitsigns_buffer_head then
--       return gitsigns_buffer_head
--     end
--   end,
--   icon = "",
-- }

local diff = {
  "diff",
  colored = true,
  symbols = { added = "+ ", modified = "~ ", removed = "- " }, -- changes diff symbols
  -- symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
  source = function()
    local gitsigns_status = vim.b.gitsigns_status_dict

    if gitsigns_status then
      return {
        added = gitsigns_status.added,
        modified = gitsigns_status.changed,
        removed = gitsigns_status.removed
      }
    end
  end,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_lsp" },
  sections = { "error", "warn", "info" },
  symbols = { error = " ", warn = " ", info = " " },
  colored = true,
  always_visible = false,
}

local time = {
  "os.date('%H:%M')",
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local lsp_name = {
  function()
    local names = {}
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes

      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        table.insert(names, client.name)
      end
    end

    if next(names) then
      return "[" .. table.concat(names, " ") .. "]"
    end

    return ""
  end,
}

-- local location = {
--   "location",
--   padding = 0,
-- }

-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
-- 	local chars = { " ", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    -- disabled_filetypes = { "alpha" },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { "mode", },
    lualine_b = { "branch", }, -- { {'b:gitsigns_head', icon = ''}, },
    lualine_x = { diagnostics, time, filetype, lsp_name, "encoding", }, -- { {'diff', source = diff_source}, }
    lualine_c = { diff, }, -- { {'diff', source = diff_source} }
    lualine_y = { time, },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
