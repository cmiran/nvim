local function get_top_padding(ext)
  ext = ext or 0
  local win_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5)
  local header = require("alpha.themes.dashboard").section.header.val
  local header_height = math.floor(#header * 0.65)
  local padding = win_height - header_height - ext

  return win_height < header_height and 0 or padding
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local fortune = require("alpha.fortune")()
    local logo = {
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

    dashboard.section.header.opts.hl = "Error"
    dashboard.section.header.val = logo
    -- dashboard.opts.opts.noautocmd = true
    dashboard.opts.layout = {
      { type = "padding", val = get_top_padding(#fortune) },
      dashboard.section.header,
      { type = "padding", val = 1 },
      {
        type = "text",
        val = fortune,
        opts = { position = "center" },
      },
    }

    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        desc = "close Lazy and re-open when the dashboard is ready",
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    -- vim.api.nvim_create_autocmd("FileType", {
    --   desc = "update footer when LazyVimStarted",
    --   pattern = "LazyVimStarted",
    --   callback = function()
    --     local stats = require("lazy").stats()
    --     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    --     dashboard.section.footer.val =
    --       { "loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
    --     pcall(vim.cmd.AlphaRedraw)
    --   end,
    -- })

    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "alpha",
    --   desc = 'hide cursor for alpha',
    --   callback = function()
    --     local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
    --     hl.blend = 100
    --     vim.api.nvim_set_hl(0, 'Cursor', hl)
    --     vim.opt.guicursor:append('a:Cursor/lCursor')
    --   end,
    -- })

    -- vim.api.nvim_create_autocmd('BufLeave', {
    --   buffer = 0,
    --   desc = 'show cursor after alpha',
    --   callback = function()
    --     local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
    --     hl.blend = 0
    --     vim.api.nvim_set_hl(0, 'Cursor', hl)
    --     vim.opt.guicursor:remove('a:Cursor/lCursor')
    --   end,
    -- })
  end,
}
