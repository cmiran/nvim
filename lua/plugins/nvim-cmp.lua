return {
  {
    -- github.com/hrsh7th/nvim-cmp
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      -- github.com/hrsh7th/cmp-buffer
      'hrsh7th/cmp-buffer',
      -- github.com/hrsh7th/cmp-path
      'hrsh7th/cmp-path',
      -- github.com/hrsh7th/cmp-cmdline
      'hrsh7th/cmp-cmdline',
      --github.com/saadparwaiz1/cmp_luasnip
      'saadparwaiz1/cmp_luasnip',
      -- github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp',
      -- github.com/hrsh7th/cmp-nvim-lua
      'hrsh7th/cmp-nvim-lua',
      -- github.com/lukas-reineke/cmp-under-comparator
      'lukas-reineke/cmp-under-comparator',
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        -- confirm = {
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = false,
        -- },
        -- enabled = function()
        --   -- disable completion in comments
        --   local context = require("cmp.config.context")
        --   -- keep command mode completion enabled when cursor is in a comment
        --   if vim.api.nvim_get_mode().mode == "c" then
        --     return true
        --   else
        --     return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        --   end
        -- end,
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        formatting = {
          format = function(_, item)
            local icons = require("util").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = true },
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sorting = {
          comparators = {
            -- Below is the default comparator list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, -- this is commented in nvim-cmp
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "cmdline" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },
      }
    end,
  },
}
