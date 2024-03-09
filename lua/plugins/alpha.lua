local get_top_padding = function(ext)
  ext = ext or 0
  local win_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5)
  local header = require("alpha.themes.dashboard").section.header.val
  local header_height = math.floor(#header * 0.7) + ext
  local padding = win_height - header_height

  return win_height < header_height and 0 or padding
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  keys = {
    { "<leader>a", ":Alpha<cr>", desc = "Alpha" },
  },
  opts = function()
    -- require("alpha.term")
    local dashboard = require("alpha.themes.dashboard")
    local fortune = require("alpha.fortune")()

    dashboard.section.header.opts.hl = "Error"
    dashboard.section.header.val = {
      [[           .......               ]],
      [[       .~!!~^:....               ]],
      [[     ^75Y~:..                    ]],
      [[   :YPY7^..                      ]],
      [[  ~G#57^:.                  ...  ]],
      [[ ~P#BP?^:..                  ... ]],
      [[ JPB#P7^:..  ...             ....]],
      [[.?YG#P?!~^:.......   ...    .....]],
      [[ ?JG&B?~^:^^^^:..::::......:!^...]],
      [[ 7JPBG!~7JPGG5J?!7~:!?Y?!^..7:.:.]],
      [[ :YYBJP&@@@@@@&B?~!J@@@@&BG?!~:: ]],
      [[  ^G&Y!7YB&#&#G5!~.!#&@#BB@Y.^~. ]],
      [[  ^GBB???Y5P?7PG#B!.^~JBBBP^..^  ]],
      [[  ?5GBPY77??7PGB#&G. .^77~:..:.  ]],
      [[   ~5P?7:.~?5G5PGB#: .^!!::^::.  ]],
      [[     5GG7.!?PJ^~J^^. .:^~Y!^.    ]],
      [[     ~PPP.?YJ~.::....:^ ~7.      ]],
      [[     :JYYPY?7~~~^:^::^^^7:.      ]],
      [[     ^JJ?YG5?7!!~^^:^^^:::.      ]],
      [[     :JJYY55Y?7~~~^:^^...:.      ]],
      [[       .^?YJ7^:::...::..:.       ]],
      [[          :~!~:.:.......         ]],
      [[             .......             ]],
    }

    dashboard.section.buttons.opts.hl = "Keyword"
    -- dashboard.section.buttons.val = {
    --   dashboard.button("f", " " .. " Find file",
    --   ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>"),
    --   dashboard.button("r", " " .. " Recent files",
    --   ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>"),
    --   dashboard.button("g", " " .. " Grep",
    --   ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({grep_open_files=true,hidden=true,no_ignore=true}))<cr>"),
    --   dashboard.button("e", "פּ " .. " Explore", ":NvimTreeToggle<cr>"),
    --   dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert<cr>"),
    --   dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua<cr>"),
    --   dashboard.button("q", " " .. " Quit", ":q<cr>"),
    --   dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    -- }

    dashboard.section.footer.opts.hl = "Type"
    -- local footer = function()
    --   local t = {}
    --   local gitsigns_head = vim.g.gitsigns_head
    --   if gitsigns_head then
    --     table.insert(t, " " .. gitsigns_head)
    --   end
    --   local datetime = os.date(" %H:%M   %d-%m-%Y")
    --   table.insert(t, datetime)
    --   return table.concat(t, "  ")
    -- end

    dashboard.opts.opts.noautocmd = true
    dashboard.opts.layout = {
      { type = "padding", val = get_top_padding(#fortune) },
      {
        type = "text",
        val = fortune,
        opts = { position = "center" },
      },
      { type = "padding", val = 1 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val =
          { "loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
