return {
  -- github.com/RRethy/vim-illuminate
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
  opts = {
    delay = 100,
    filetypes_denylist = {
      "alpha",
      "NvimTree",
      "qf",
    },
    under_cursor = false,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    Snacks.toggle({
      name = "Illuminate",
      get = function()
        return not require("illuminate.engine").is_paused()
      end,
      set = function(enabled)
        local m = require("illuminate")
        if enabled then
          m.resume()
        else
          m.pause()
        end
      end,
    }):map("<leader>ux")

    local function map(key, dir, buffer)
      local keymap = require("util").keymap
      keymap("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, {
        desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " reference",
        buffer = buffer,
      })
    end

    map("]]", "next")
    map("[[", "prev")

    -- vim.api.nvim_create_autocmd("FileType", {
    --   desc = "set keymaps after loading ftplugins, since a lot overwrite [[ and ]]",
    --   callback = function()
    --     local buffer = vim.api.nvim_get_current_buf()
    --     map("]]", "next", buffer)
    --     map("[[", "prev", buffer)
    --   end,
    -- })
  end,
}
