return {
  -- github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- github.com/folke/neoconf.nvim
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- github.com/folke/neodev.nvim
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    {
      -- github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lsp",
      -- cond = function()
      --   return require("util").has("nvim-cmp")
      -- end,
    },
    -- github.com/ii14/emmylua-nvim
    'ii14/emmylua-nvim',
  },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      float = {
        focusable = true,
        style = "minimal",
        border = "solid",
        source = "always",
        header = "",
        prefix = "",
      },
      severity_sort = true,
      underline = false,
      update_in_insert = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
    },
    -- add any global capabilities here
    capabilities = {
      textDocument = { completion = { completionItem = { snippetSupport = true } } },
    },
    -- Automatically format on save
    autoformat = true,
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- but can be also overridden when specified
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    servers = {
      -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#golangci_lint_ls
      "golangci_lint_ls",
      -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
      "gopls",
      -- github.com/hrsh7th/vscode-langservers-extracted
      "jsonls",
      -- github.com/sumneko/lua-language-server
      "lua_ls",
      -- github.com/lighttiger2505/sqls
      -- "sqlls",
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
      "tsserver",
      -- github.com/terraform-linters/tflint
      "tflint",
      -- github.com/redhat-developer/yaml-language-server
      "yamlls",
    },
    on_attach = {
      lua_ls = function(client, _)
        client.resolved_capabilities.document_formatting = false
      end,
    },
    setup = {},
  },
  config = function(_, opts)
    local Util = require("util")
    -- setup autoformat
    -- require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
    -- setup formatting and keymaps
    Util.on_attach(function(client, buffer)
      -- require("plugins.lsp.format").on_attach(client, buffer)
      require("plugins.lsp.util").on_attach(client, buffer)
    end)

    -- diagnostics
    local icons = require("util").icons.diagnostics
    for name, icon in pairs(icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    -- if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
    --   opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
    --   or function(diagnostic)
    --     for d, icon in pairs(icons) do
    --       if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
    --         return icon
    --       end
    --     end
    --   end
    -- end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --   border = "solid",
    --   width = 78,
    -- })
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    --   border = "solid",
    --   width = 78,
    -- })

    -- servers
    local servers = opts.servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = {
        on_attach = opts.on_attach[server] or nil,
        capabilities = vim.deepcopy(capabilities),
      }
      local has_custom_opts, custom_opts = pcall(require, "plugins.lsp.opts." .. server)
      if has_custom_opts then
        server_opts = vim.tbl_deep_extend("force", server_opts, custom_opts)
      end

      require("lspconfig")[server].setup(server_opts)
    end

    for _,s in pairs(servers) do
      setup(s)
    end
  end,
}
