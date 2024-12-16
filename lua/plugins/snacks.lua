return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@module "snacks.nvim"
  ---@type snacks.Config
  opts = {
    lazygit = {
      enabled = true,
    },
    -- notify = { enabled = true },
    notifier = {
      enabled = true,
    },
    styles = {
      lazygit = {
        border = "shadow",
      },
      notification_history = {
        border = "shadow",
        keys = {
          esc = { "<esc>", { "close", "cancel" } },
        },
      }
    }
  },
  keys = {
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    { "<leader>bA", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
    { "<leader>bO", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification history" },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.dim():map("<leader>uD")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("relativenumber", { name = "relative number" }):map("<leader>uL")
        Snacks.toggle.treesitter({ name = "treesitter context" }):map("<leader>uT")
      end,
    })
  end,
}
