return {
  -- github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- github.com/folke/neoconf.nvim
    { "folke/neoconf.nvim", cmd = "Neoconf", opts = {} },
    -- github.com/folke/neodev.nvim
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    -- github.com/hrsh7th/cmp-nvim-lsp
    -- "hrsh7th/cmp-nvim-lsp",
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
    capabilities = {},
    autoformat = false,
    -- options for vim.lsp.buf.format()
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    servers = {
      -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#buf_ls
      "buf_ls",
      -- github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ccls
      "ccls",
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
      "pyright",
      -- github.com/lighttiger2505/sqls
      "sqlls",
      -- github.com/stoplightio/spectral
      -- "spectral",
      -- github.com/hyperledger/solang
      "solang",
      -- github.com/ethereum/solc-js
      "solc",
      -- github.com/qiuxiang/solidity-ls
      "solidity",
      -- github.com/juanfranblanco/vscode-solidity
      "solidity_ls",
      -- github.com/hashicorp/terraform-ls
      "terraformls",
      -- github.com/typescript-language-server/typescript-language-server
      "ts_ls",
      -- github.com/terraform-linters/tflint
      -- "tflint",
      -- github.com/redhat-developer/yaml-language-server
      "yamlls",
    },
    on_attach = {
      lua_ls = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
      end,
    },
    setup = {},
  },
  config = function(_, opts)
    require("util").on_attach(function(client, buffer)
      require("plugins.lsp.keymap").on_attach(client, buffer)
    end)

    -- diagnostics
    local icons = require("util").icons.diagnostics
    for name, icon in pairs(icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config(opts.diagnostics)

    -- servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      -- require("cmp_nvim_lsp").default_capabilities(),
      require("blink.cmp").get_lsp_capabilities(),
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = {
        on_attach = opts.on_attach[server] or nil,
        capabilities = capabilities,
      }
      local has_custom_opts, custom_opts =
        pcall(require, "plugins.lsp.opts." .. server)

      if has_custom_opts then
        server_opts = vim.tbl_deep_extend("force", server_opts, custom_opts)
      end

      require("lspconfig")[server].setup(server_opts)
    end

    for _, s in pairs(opts.servers) do
      setup(s)
    end
  end,
}
