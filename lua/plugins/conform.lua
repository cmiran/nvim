return {
  -- github.com/stevearc/conform.nvim
  "stevearc/conform.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = { "BufEnter", "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      desc = "Format",
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua", lsp_format = "prefer" },
      go = { "goimports", "gofmt", "gofumpt", lsp_format = "last" },
      json = { "prettier", "yq", lsp_format = "fallback" },
      tf = { "terraform_fmt", lsp_format = "fallback" },
      typescript = { "prettier", lsp_format = "fallback" },
      typescriptreact = { "prettier", lsp_format = "fallback" },
      yaml = { "prettier", "yamlfmt", lsp_format = "fallback" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 600 }
    end,
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Enable autoformat-on-save",
    })

    Snacks.toggle({
      name = "autoformat-on-save",
      get = function()
        return not vim.g.disable_autoformat and not vim.b.disable_autoformat
      end,
      set = function(state)
        vim.b.disable_autoformat = not state
        vim.g.disable_autoformat = not state
      end,
    }):map("<leader>cF")
  end,
}
