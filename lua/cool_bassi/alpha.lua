local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

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

dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file",
  ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>"),
  dashboard.button("r", " " .. " Recent files",
  ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>"),
  dashboard.button("g", " " .. " Grep",
  ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({grep_open_files=true,hidden=true,no_ignore=true}))<cr>"),
  dashboard.button("e", "פּ " .. " Explore", ":NvimTreeToggle<cr>"),
  dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert<cr>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua<cr>"),
  dashboard.button("q", " " .. " Quit", ":q<cr>"),
  -- dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
}

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
dashboard.section.footer.val = require("alpha.fortune")

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
