require('toggleterm').setup({
	size = vim.api.nvim_win_get_height(0) * 0.5,
	open_mapping = [[«]],
	hide_numbers = true,
  highlights = {
    Normal = {
      guibg = "#000000",
    },
    NormalFloat = {
      guibg = "#000000",
      -- link = 'Normal'
    },
    -- FloatBorder = {
    --   guifg = "<VALUE-HERE>",
    --   guibg = "<VALUE-HERE>",
    -- },
  },
	-- shade_filetypes = {},
	shade_terminals = false,
	-- shading_factor = 3,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal", -- horizontal
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "none",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true, silent = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-Left>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-Down>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-Up>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-Right>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local terminal = require("toggleterm.terminal").Terminal

local htop = terminal:new({
  cmd = "htop",
  hidden = true,
  direction = "float",
  highlights = {
    NormalFloat = {
      guibg = "#000000",
    },
  },
  float_opts = {
    border = "none",
  },
})
function _HTOP_TOGGLE()
	htop:toggle()
end

local lazygit = terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  highlights = {
    NormalFloat = {
      guibg = "#000000",
    },
    -- FloatBorder = {
    --   guibg = "#000000",
    --   guifg = "<VALUE-HERE>",
    -- },
  },
  float_opts = {
    border = "none",
    width = math.floor(vim.o.columns * 0.95),
    height = math.floor(vim.o.lines * 0.92),
  },
  -- on_open = function(_)
  --   vim.cmd "startinsert!"
  --   -- vim.cmd "set laststatus=0"
  -- end,
  -- on_close = function(_)
  --   -- vim.cmd "set laststatus=3"
  -- end,
  -- count = 99,
})
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local lua = terminal:new({
  cmd = "lua",
  hidden = true,
})
function _LUA_TOGGLE()
	lua:toggle()
end

local ncdu = terminal:new({
  cmd = "ncdu",
  hidden = true,
  direction = 'float',
  highlights = {
    NormalFloat = {
      guibg = "#000000",
    },
  },
  float_opts = {
    border = "none",
  },
})
function _NCDU_TOGGLE()
	ncdu:toggle()
end

