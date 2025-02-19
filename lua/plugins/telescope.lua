return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    -- github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
    -- github.com/nvim-telescope/telescope-ui-select.nvim
    "nvim-telescope/telescope-ui-select.nvim",
    -- github.com/nvim-telescope/telescope-fzf-native.nvim
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- github.com/nvim-telescope/telescope-github.nvim
    -- "nvim-telescope/telescope-github.nvim",
  },
  keys = {
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
    { "<leader>fg", "<cmd>Telescope grep_string<cr>", desc = "Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "List branch(es)" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "List commit(s)" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Autocommands" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
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
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        layout_strategy = "center",
        path_display = { "absolute" },
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",
        },
        mappings = {
          i = {
            ["<C-c>"] = actions.close,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
          n = {
            ["<ESC>"] = actions.close,
            ["<C-c>"] = actions.close,
            ["q"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["j"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["k"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["G"] = actions.move_to_bottom,
            ["<CR>"] = actions.select_default,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        autocommands = {
          previewer = false,
          layout_config = {
            width = 0.8,
          },
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          show_all_buffers = true,
        },
        diagnostics = {
          theme = "dropdown",
          layout_strategy = "vertical",
        },
        find_files = {
          theme = "dropdown",
          hidden = true,
          no_ignore = true,
          previewer = false,
        },
        git_branches = {
          theme = "dropdown",
          previewer = false,
        },
        git_commits = {
          theme = "dropdown",
          previewer = false,
          git_command = {
            "git",
            "log",
            "--pretty=%h %>(12,trunc)%ad %<(7,trunc)%aN %s",
          },
          layout_config = {
            width = 0.8,
          },
        },
        git_status = {
          theme = "dropdown",
          layout_strategy = "vertical",
          layout_config = {
            height = 0.8,
          },
        },
        grep_string = {
          theme = "ivy",
          layout_strategy = "vertical",
        },
        help_tags = {
          previewer = false,
        },
        highlights = {
          theme = "dropdown",
          layout_strategy = "vertical",
          layout_config = {
            height = 0.6,
          },
        },
        lsp_document_symbols = {
          theme = "ivy",
          layout_strategy = "vertical",
        },
        lsp_references = {
          layout_strategy = "vertical",
        },
        lsp_workspace_symbols = {
          theme = "ivy",
          layout_strategy = "vertical",
        },
        oldfiles = {
          theme = "dropdown",
          hidden = true,
          no_ignore = true,
          previewer = false,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_cursor({}),
        },
        -- fzf = {
        --   fuzzy = true,                    -- false will only do exact matching
        --   override_generic_sorter = true,  -- override the generic sorter
        --   override_file_sorter = true,     -- override the file sorter
        --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- },
      },
    }
  end,
  init = function()
    -- require("telescope").load_extension("fzf")
    require("telescope").load_extension("noice")
    -- require("telescope").load_extension("notify")
    require("telescope").load_extension("ui-select")
  end,
}
