local M = {}

---@param mode any
---@param lhs string
---@param rhs any
---@param opts table
function M.keymap(mode, lhs, rhs, opts)
  opts = vim.tbl_extend(
    "keep",
    opts or {},
    { noremap = true, nowait = true, silent = true }
  )
  vim.keymap.set(mode, lhs, rhs, opts)
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    desc = "attach lsp client",
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_clients({ id = args.data.client_id })[1]
      on_attach(client, buffer)
    end,
  })
end

---@param plugin string
---@return boolean
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- see if the file exists
---@param path string
---@return boolean
function M.file_exists(path)
  local f = io.open(path, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

---@param paths string[]
---@return boolean
function M.config_file_exists_at_root_pattern(paths)
  for _, root in ipairs(vim.lsp.list_workspace_folders()) do
    for _, path in ipairs(paths) do
      if M.file_exists(root .. path) then
        return true
      end
    end
  end
  return false
end

-- delay notifications till vim.notify was replaced or after 500ms
function M.lazy_notify()
  local notifs = {}
  local function temp(...)
    table.insert(notifs, vim.F.pack_len(...))
  end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.uv.new_timer()
  local check = vim.uv.new_check()

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig -- put back the original notify if needed
    end
    vim.schedule(function()
      ---@diagnostic disable-next-line: no-unknown
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  -- wait till vim.notify has been replaced
  check:start(function()
    if vim.notify ~= temp then
      replay()
    end
  end)
  -- or if it took more than 500ms, then something went wrong
  timer:start(500, 0, replay)
end

-- find more here: https://www.nerdfonts.com/cheat-sheet
M.icons = {
  dap = {
    Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = "",
    BreakpointCondition = "",
    BreakpointRejected = { "", "DiagnosticError" },
    LogPoint = ".>",
  },
  diagnostics = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
  },
  git = {
    added = "",
    modified = "",
    removed = "",
  },

  kinds = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Copilot = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
}

---@param name string
---@return {foreground?:number}?
function M.fg(name)
  ---@type {foreground?:number}?
  local hl = vim.api.nvim_get_hl(0, { name = name })
  local fg = hl and (hl.fg or hl.foreground)
  return fg and { fg = string.format("#%06x", fg) }
end

M.timers = {}
function M.debounce(name, fn, delay)
  delay = delay or 100
  if M.timers[name] then
    M.timers[name]:stop()
    pcall(function()
      M.timers[name]:close()
    end)
  end
  M.timers[name] = vim.defer_fn(function()
    M.timers[name] = nil
    fn()
  end, delay)
end

return M
