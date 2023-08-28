return {
  "nvim-cmp",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        require("util").on_attach(function(client)
          if client.name == "copilot" then
            copilot_cmp._on_insert_enter()
          end
        end)
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    table.insert(opts.sources, 1, { name = "copilot" })

    local confirm = opts.mapping["<CR>"]
    local confirm_copilot = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    })

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<CR>"] = function(...)
        local entry = cmp.get_selected_entry()
        if entry and entry.source.name == "copilot" then
          return confirm_copilot(...)
        end
        return confirm(...)
      end,
    })

    opts.sorting.comparators = vim.tbl_extend("force", {
      require("copilot_cmp.comparators").prioritize
    }, opts.sorting.comparators)
  end,
}
