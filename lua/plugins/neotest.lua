local function get_nearest_function_name()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == "function_declaration" then
      return ts_utils.get_node_text(node:child(1))[1]
    end
    node = node:parent()
  end
end

-- github.com/nvim-neotest/neotest
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "folke/trouble.nvim",
    "nvim-neotest/neotest-go",
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand("%"))

        vim.notify("Run all file test", vim.log.levels.INFO, {
          title = "Neotest",
        })
      end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.loop.cwd())

        vim.notify("Run test suite", vim.log.levels.INFO, {
          title = "Neotest",
        })
      end,
      desc = "Run all",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()

        vim.notify("Run nearest test", vim.log.levels.INFO, {
          title = "Neotest",
        })
      end,
      desc = "Run nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()

        vim.notify("Run latest test ran", vim.log.levels.INFO, {
          title = "Neotest",
        })
      end,
      desc = "Run last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle output panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()

        vim.notify("Stopping nearest", vim.log.levels.WARN, {
          title = "Neotest",
        })
      end,
      desc = "Stop",
    },
    {
      "<leader>tf",
      function()
        local name = get_nearest_function_name()
        if not name then
          vim.notify("No function found", vim.log.levels.WARN, {
            title = "Neotest",
          })
          return
        end

        require("neotest").run.run({
          extra_args = { "-run", name },
        })

        vim.notify("Testing " .. name, vim.log.levels.INFO, {
          title = "Neotest",
        })
      end,
      desc = "Test nearest function",
    },
  },
  opts = {
    icons = {
      passed = "",
      running = "",
      failed = "",
      unknown = "",
    },
    floating = {
      border = "solid",
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if require("lazyvim.util").has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
  },
  config = function(_, opts)
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message
            :gsub("\n", " ")
            :gsub("\t", " ")
            :gsub("%s+", " ")
            :gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    opts.consumers = {}
    opts.consumers.trouble = function(client)
      client.listeners.results = function(adapter_id, results, partial)
        if partial then
          return
        end
        local tree = assert(client:get_position(nil, { adapter = adapter_id }))

        local failed = 0
        for pos_id, result in pairs(results) do
          if result.status == "failed" and tree:get_key(pos_id) then
            failed = failed + 1
          end
        end
        vim.schedule(function()
          local trouble = require("trouble")
          if trouble.is_open() then
            trouble.refresh()
            if failed == 0 then
              trouble.close()
            end
          end
        end)
        return {}
      end
    end

    opts.adapters = {
      require("neotest-go")({
        experimental = {
          test_table = true,
        },
        args = { "-count=1" },
      }),
    }

    require("neotest").setup(opts)
  end,
}
