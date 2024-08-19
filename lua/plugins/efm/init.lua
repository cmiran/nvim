local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

local keys = {
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
  { "n", "]d", diagnostic_goto(true), { desc = "Next diagnostic" } },
  { "n", "[d", diagnostic_goto(false), { desc = "Prev diagnostic" } },
  { "n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next error" } },
  { "n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev error" } },
  { "n", "]i", diagnostic_goto(true, "INFO"), { desc = "Next info" } },
  { "n", "[i", diagnostic_goto(false, "INFO"), { desc = "Prev info" } },
  { "n", "]t", diagnostic_goto(true, "HINT"), { desc = "Next hint" } },
  { "n", "[t", diagnostic_goto(false, "HINT"), { desc = "Prev hint" } },
  { "n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next warning" } },
  { "n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev warning" } },
}

---@param _ table
---@param buffer integer
local function on_attach(_, buffer)
  local keymap = require("util").keymap
  for _, key in pairs(keys) do
    key[4].buffer = buffer
    keymap(key[1], key[2], key[3], key[4])
  end
end

return {
  -- github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- github.com/folke/neoconf.nvim
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- github.com/folke/neodev.nvim
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    -- github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",
    -- github.com/ii14/emmylua-nvim
    "ii14/emmylua-nvim",
  },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      float = {
        header = "",
      },
      severity_sort = true,
      underline = false,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
      },
    },
    autoformat = true,
    -- options for vim.lsp.buf.format()
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    on_attach = {
      lua_ls = function(client, _)
        client.resolved_capabilities.document_formatting = false
      end,
    },
    setup = {},
  },
  config = function(_, opts)
    -- diagnostics
    local icons = require("util").icons.diagnostics
    for name, icon in pairs(icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
      opts.capabilities or {}
    )

    require("lspconfig").efm.setup({
      init_options = { documentFormatting = true },
      capabilities = vim.deepcopy(capabilities),
      filetypes = { "lua" },
      on_attach = on_attach,
    })
  end,
}
