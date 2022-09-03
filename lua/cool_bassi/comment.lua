local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  padding = true, -- add a space b/w comment and the line
  sticky = true, -- whether the cursor should stay at its position
  ignore = '^$', -- ignores empty lines
  -- LHS of toggle mappings in NORMAL mode
  toggler = {
    line = 'gcc', -- line-comment toggle keymap
    block = 'gbc', -- block-comment toggle keymap
  },
  -- LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    line = 'gc', -- line-comment keymap
    block = 'gb', -- block-comment keymap
  },
  -- LHS of extra mappings
  extra = {
    above = 'gcO', -- add comment on the line above
    below = 'gco', -- add comment on the line below
    eol = 'gcA', -- add comment at the end of line
  },
  -- Enable keybindings
  -- NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    -- Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
    -- Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
    extended = false,
  },
  -- Function to call before (un)comment
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
  -- Function to call after (un)comment
  post_hook = nil,
}
