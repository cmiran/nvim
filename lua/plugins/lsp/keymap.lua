local M = {}

---@param next boolean
---@param severity string | nil
function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

M.keys = {
  {
    "n",
    "gd",
    "<cmd>Telescope lsp_definitions<cr>",
    { desc = "goto definition" },
  },
  { "n", "gD", vim.lsp.buf.declaration, { desc = "goto declaration" } },
  {
    "n",
    "gI",
    "<cmd>Telescope lsp_implementations<cr>",
    { desc = "Go to implementation" },
  },
  { "n", "gl", vim.diagnostic.open_float, { desc = "line diagnostics" } },
  { "n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "references" } },
  {
    "n",
    "gy",
    "<cmd>Telescope lsp_type_definitions<cr>",
    { desc = "Go to t[y]pe Definition" },
  },
  { "n", "K", vim.lsp.buf.hover, { desc = "hover" } },
  { "n", "gK", vim.lsp.buf.signature_help, { desc = "signature help" } },
  { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Action" } },
  { "n", "<leader>bl", "<cmd>LspInfo<cr>", { desc = "Lsp info" } },
  {
    "n",
    "<leader>cA",
    function()
      vim.lsp.buf.code_action({
        context = {
          only = {
            "source",
          },
          diagnostics = {},
        },
      })
    end,
    { desc = "Source Action" },
  },
  { "n", "<leader>cl", vim.lsp.codelens.run, { desc = "CodeLens action" } },
  { "n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Quickfix" } },
  { "n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" } },
  { "n", "<leader>cr", vim.lsp.buf.rename, { desc = "Global rename" } },
  { "i", "<c-k>", vim.lsp.buf.signature_help, { desc = "signature help" } },
  { "n", "]d", M.diagnostic_goto(true), { desc = "Next diagnostic" } },
  { "n", "[d", M.diagnostic_goto(false), { desc = "Prev diagnostic" } },
  { "n", "]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next error" } },
  { "n", "[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev error" } },
  { "n", "]i", M.diagnostic_goto(true, "INFO"), { desc = "Next info" } },
  { "n", "[i", M.diagnostic_goto(false, "INFO"), { desc = "Prev info" } },
  { "n", "]t", M.diagnostic_goto(true, "HINT"), { desc = "Next hint" } },
  { "n", "[t", M.diagnostic_goto(false, "HINT"), { desc = "Prev hint" } },
  { "n", "]w", M.diagnostic_goto(true, "WARN"), { desc = "Next warning" } },
  { "n", "[w", M.diagnostic_goto(false, "WARN"), { desc = "Prev warning" } },
}

---@param _ table
---@param buffer integer
function M.on_attach(_, buffer)
  local keymap = require("util").keymap
  for _, key in pairs(M.keys) do
    key[4].buffer = buffer
    keymap(key[1], key[2], key[3], key[4])
  end
end

return M
