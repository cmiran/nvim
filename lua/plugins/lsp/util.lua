local M = {}

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

M.keys = {
  { "n", "gl", vim.diagnostic.open_float, { desc = "line diagnostics" } },
  { "n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "lsp info" } },
  { "n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "goto definition" } },
  { "n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "references" } },
  { "n", "gD", vim.lsp.buf.declaration, { desc = "goto declaration" } },
  { "n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "doto implementation" } },
  { "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "goto t[y]pe Definition" } },
  { "n", "K", vim.lsp.buf.hover, { desc = "hover" } },
  { "n", "gK", vim.lsp.buf.signature_help, { desc = "signature help" } },
  { "i", "<c-k>", vim.lsp.buf.signature_help, { desc = "signature help" } },
  { "n", "]d", M.diagnostic_goto(true), { desc = "next diagnostic" } },
  { "n", "[d", M.diagnostic_goto(false), { desc = "prev diagnostic" } },
  { "n", "]e", M.diagnostic_goto(true, "ERROR"), { desc = "next error" } },
  { "n", "[e", M.diagnostic_goto(false, "ERROR"), { desc = "prev error" } },
  { "n", "]w", M.diagnostic_goto(true, "WARN"), { desc = "next warning" } },
  { "n", "[w", M.diagnostic_goto(false, "WARN"), { desc = "prev warning" } },
  --"n",  { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
  --"n",  { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
  { { "n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" } },
  {
    "n", "<leader>cA",
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
  { "n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" } },
}

function M.on_attach(_, buffer)
  local keymap = require("util").keymap
  for _, key in pairs(M.keys) do
    key[4]["buffer"] = buffer
    keymap(key[1], key[2], key[3], key[4])
  end
end

return M

-- function M.get()
--   -- local format = function()
--   --   require("lazyvim.plugins.lsp.format").format({ force = true })
--   -- end
--   if not M._keys then
--   ---@class PluginLspKeys
--     -- stylua: ignore
--     M._keys =  {

--       { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
--       { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
--       { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },
--       -- { "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Goto Definition", has = "definition" },
--       -- { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Goto Definition", has = "definition" },
--       { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
--       { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
--       { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
--       { "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },
--       { "K", vim.lsp.buf.hover, desc = "Hover" },
--       { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
--       { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
--       { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
--       { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
--       { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
--       { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
--       { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
--       { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
--       -- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
--       -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
--       { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
--       {
--         "<leader>cA",
--         function()
--           vim.lsp.buf.code_action({
--             context = {
--               only = {
--                 "source",
--               },
--               diagnostics = {},
--             },
--           })
--         end,
--         desc = "Source Action",
--         has = "codeAction",
--       },
--       { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
--     }
--   end
--   return M._keys
-- end
