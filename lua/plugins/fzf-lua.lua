return {
  -- github.com/ibhagwan/fzf-lua
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fb", "<cmd>FzfLua buffers<cr>",                    desc = "Buffers" },
    { "<leader>ff", "<cmd>FzfLua files<cr>",                      desc = "Files" },
    { "<leader>fg", "<cmd>FzfLuaLiveGrep<cr>",                    desc = "Grep" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",                   desc = "Recent files" },
    { "<leader>fv", "<cmd>FzfLuaGrepVisual<cr>",                  desc = "Visual selection",      mode = "v" },
    { "<leader>fw", "<cmd>FzfLuaGrepCword<cr>",                   desc = "Word under cusror" },
    { "<leader>fW", "<cmd>FzfLuaGrepCWORD<cr>",                   desc = "String under cusror" },
    { "gd",         "<cmd>FzfLua lsp_definitions<cr>",            desc = "Lsp definition" },
    { "gD",         "<cmd>FzfLua lsp_declaration<cr>",            desc = "Lsp declaration" },
    { "gi",         "<cmd>FzfLua lsp_implementations<cr>",        desc = "Lsp implementation" },
    { "gr",         "<cmd>FzfLua lsp_references<cr>",             desc = "references" },
    { "gt",         "<cmd>FzfLua lsp_typedefs<cr>",               desc = "Lsp type Definition" },
    { "<leader>ca", "<cmd>FzfLuaLspCodeActions<cr>",              desc = "Action",                mode = { "n", "v" } },
    { "<leader>lf", "<cmd>FzfLua lsp_finder",                     desc = "Find all" },
    { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "Find document symbols" },
    { "<leader>lw", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "Find workspace symbols" },
  },
  opts = {
    "ivy",
    fzf_colors = true,
    fzf_opts = {
      ["--no-scrollbar"] = true,
    },
    winopts = {
      backdrop = 100,
      border = "shadow",
      preview = {
        border = "shadow",
        layout = "horizontal",
        scrollbar = false,
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command("FzfLuaLiveGrep", function()
      require("fzf-lua").live_grep({
        winopts = {
          height = 0.4,
          preview = {
            border = "shadow",
            layout = "vertical",
            scrollbar = false,
          }
        },
      })
    end, {})

    vim.api.nvim_create_user_command("FzfLuaGrepCword", function()
      require("fzf-lua").grep_cword({
        winopts = {
          height = 0.4,
          preview = {
            border = "shadow",
            layout = "vertical",
            scrollbar = false,
          }
        },
      })
    end, {})

    vim.api.nvim_create_user_command("FzfLuaGrepCWORD", function()
      require("fzf-lua").grep_cWORD({
        winopts = {
          height = 0.4,
          preview = {
            border = "shadow",
            layout = "vertical",
            scrollbar = false,
          }
        },
      })
    end, {})

    vim.api.nvim_create_user_command("FzfLuaGrepVisual", function()
      require("fzf-lua").grep_visual({
        winopts = {
          height = 0.4,
          preview = {
            border = "shadow",
            layout = "vertical",
            scrollbar = false,
          }
        },
      })
    end, {})

    vim.api.nvim_create_user_command("FzfLuaLspCodeActions", function()
      require("fzf-lua").lsp_code_actions({
        winopts = {
          height = 0.4,
          preview = {
            border = "shadow",
            layout = "vertical",
            scrollbar = false,
          }
        },
      })
    end, {})

    require("fzf-lua").setup(opts)
  end,
}
