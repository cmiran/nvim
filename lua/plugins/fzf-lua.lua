return {
  -- github.com/ibhagwan/fzf-lua
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fb", "<cmd>FzfLua buffers<cr>",  desc = "Buffers" },
    { "<leader>ff", "<cmd>FzfLua files<cr>",    desc = "Files" },
    { "<leader>fg", "<cmd>FzfLua grep<cr>",     desc = "Grep" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    -- { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
    -- { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
    -- { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "List branch(es)" },
    -- { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "List commit(s)" },
    -- { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
    -- { "<leader>sa", "<cmd>FzfLua autocommands<cr>", desc = "Autocommands" },
    -- { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command history" },
    -- { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    -- { "<leader>sd", "<cmd>FzfLua diagnostics<cr>", desc = "Diagnostics" },
    -- { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
    -- { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Highlights" },
    -- { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    -- {
    --   "<leader>sm",
    --   function()
    --     require("telescope").extensions.notify.notify({
    --       theme = "dropdown",
    --       layout_strategy = "vertical",
    --       layout_config = {
    --         height = 0.8,
    --         width = 0.6,
    --       },
    --     })
    --   end,
    --   desc = "Notifications",
    -- },
    -- { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
    -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  },
  opts = {
    'ivy',
    fzf_colors = true,
    fzf_opts = {
      ["--no-scrollbar"] = true,
    },
    winopts = {
      border = "shadow",
      preview = {
        border    = "shadow",
        layout    = "horizontal",
        -- hidden    = true,
      },
    },
    -- hls = {
    --   normal = { bg = "bg0" },
    -- }
  }
}
