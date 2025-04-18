local M = {}

---@param count integer
---@param severity string | nil
function M.diagnostic_jump(count, severity)
  local opts = {
    count = count,
    severity = severity and vim.diagnostic.severity[severity] or nil,
  }
  return function()
    vim.diagnostic.jump(opts)
  end
end

function M.toggle_virtual_lines_diagnostic()
  local current_config = vim.diagnostic.config()
  local virtual_lines = current_config.virtual_lines
  local status, new_config

  if not virtual_lines then
    status = "enabled"
    new_config = { virtual_lines = true }
  elseif type(virtual_lines) == "boolean" and virtual_lines then
    status = "enabled current line"
    new_config = { virtual_lines = { current_line = true } }
  else
    status = "disabled"
    new_config = { virtual_lines = false }
  end

  vim.diagnostic.config(new_config)
  vim.notify("Diagnostics virtual lines " .. status)
end

local keys = {
  -- { "n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" } },
  {
    "n",
    "gd",
    "<cmd>Telescope lsp_definitions<cr>",
    { desc = "goto definition" },
  },
  { "n", "gD", vim.lsp.buf.declaration,             { desc = "goto declaration" } },
  -- { "n", "gI", vim.lsp.buf.implementation, { desc = "goto Implementation" } },
  {
    "n",
    "gI",
    "<cmd>Telescope lsp_implementations<cr>",
    { desc = "Go to implementation" },
  },
  { "n", "gl", vim.diagnostic.open_float,           { desc = "line diagnostics" } },
  -- { "n", "gr", vim.lsp.buf.references, { desc = "references", nowait = true } },
  { "n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "references" } },
  -- { "n", "gy", vim.lsp.buf.type_definition, { desc = "goto t[y]pe Definition" } },
  {
    "n",
    "gy",
    "<cmd>Telescope lsp_type_definitions<cr>",
    { desc = "goto t[y]pe Definition" },
  },
  { "n",          "K",          vim.lsp.buf.hover,          { desc = "hover" } },
  { "n",          "gK",         vim.lsp.buf.signature_help, { desc = "signature help" } },
  { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,    { desc = "action" } },
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
  { "n", "<leader>cl", vim.lsp.codelens.run,              { desc = "CodeLens action" } },
  { "n", "<leader>cq", vim.diagnostic.setloclist,         { desc = "Quickfix" } },
  { "n", "<leader>cf", vim.lsp.buf.format,                { desc = "Format" } },
  { "n", "<leader>cr", vim.lsp.buf.rename,                { desc = "Global rename" } },
  { "i", "<c-k>",      vim.lsp.buf.signature_help,        { desc = "signature help" } },
  { "n", "]e",         M.diagnostic_jump(1, "ERROR"),     { desc = "Next error" } },
  { "n", "[e",         M.diagnostic_jump(-1, "ERROR"),    { desc = "Prev error" } },
  { "n", "]i",         M.diagnostic_jump(1, "INFO"),      { desc = "Next info" } },
  { "n", "[i",         M.diagnostic_jump(-1, "INFO"),     { desc = "Prev info" } },
  { "n", "]t",         M.diagnostic_jump(1, "HINT"),      { desc = "Next hint" } },
  { "n", "[t",         M.diagnostic_jump(-1, "HINT"),     { desc = "Prev hint" } },
  { "n", "]w",         M.diagnostic_jump(1, "WARN"),      { desc = "Next warning" } },
  { "n", "[w",         M.diagnostic_jump(-1, "WARN"),     { desc = "Prev warning" } },
  { "n", "<leader>ul", M.toggle_virtual_lines_diagnostic, { desc = "Toggle line diagnostics" } },
}

---@param buffer integer
function M.on_attach(buffer)
  local keymap = require("util").keymap
  for _, key in pairs(keys) do
    key[4].buffer = buffer
    keymap(key[1], key[2], key[3], key[4])
  end
end

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP on-attach",
  callback = function(event)
    M.on_attach(event.buf)
  end,
})

-- This is copied straight from blink
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities
local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Setup language servers.

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

-- Enable each language server by filename under the lsp/ folder
vim.lsp.enable(
  {
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#buf_ls
    "buf_ls",
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ccls
    -- "ccls",
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dockerls
    "dockerls",
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#golangci_lint_ls
    "golangci_lint_ls",
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls
    "gopls",
    -- github.com/hrsh7th/vscode-langservers-extracted
    "jsonls",
    -- github.com/sumneko/lua-language-server
    "lua_ls",
    -- microsoft.github.io/pyright/#/
    -- "pyright",
    -- github.com/stoplightio/spectral
    -- "spectral",
    -- github.com/hyperledger/solang
    -- "solang",
    -- github.com/ethereum/solc-js
    -- "solc",
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#solidity_ls_nomicfoundation
    "solidity_ls_nomicfoundation",
    -- github.com/joe-re/sql-language-server
    "sqlls",
    -- github.com/hashicorp/terraform-ls
    "terraformls",
    -- github.com/typescript-language-server/typescript-language-server
    "ts_ls",
    -- github.com/terraform-linters/tflint
    -- "tflint",
    -- github.com/redhat-developer/yaml-language-server
    "yamlls", }
)

vim.diagnostic.config({
  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
