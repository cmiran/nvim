# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. Primarily tailored for Go development, with support for TypeScript, Lua, Terraform, Solidity, SQL, YAML, JSON, Docker, and GraphQL.

## Architecture

**Entry point:** `init.lua` loads options → lazy.nvim → LSP config, then defers keymaps and autocmds via `VeryLazy` event.

**Directory structure:**
- `lua/config/` — Core config: `options.lua`, `keymaps.lua`, `autocmds.lua`, `lazy.lua` (plugin manager setup), `lsp.lua` (LSP keybindings, capabilities, `vim.lsp.enable()` calls, diagnostics config)
- `lua/plugins/` — One file per plugin, each returns a lazy.nvim spec table. Auto-imported via `{ import = "plugins" }` in `lazy.lua`
- `lsp/` — Native Neovim LSP config files (one per server), loaded by `vim.lsp.config()` / `vim.lsp.enable()`
- `lua/util.lua` — Shared helpers: `keymap()` wrapper, `icons` table, `on_attach()`, `has()`, `file_exists()`, `config_file_exists_at_root_pattern()`, `lazy_notify()`, `debounce()`, `fg()`
- `after/ftplugin/` — Filetype-specific overrides
- `queries/go/` — Custom treesitter queries (SQL injection highlighting in Go strings)

## Key conventions

- **Leader key:** Space
- **Indentation:** 2 spaces (tabs expanded), enforced by options
- **Plugin specs:** Each plugin is a single file in `lua/plugins/` returning a lazy.nvim spec. Use lazy-loading via `event`, `cmd`, `keys`, or `ft` fields
- **LSP setup:** Uses Neovim's native `vim.lsp.config()` + `vim.lsp.enable()` (not nvim-lspconfig). Server configs live in `lsp/*.lua`. Capabilities are merged with blink.cmp
- **Formatting:** conform.nvim with format-on-save (disable with `:FormatDisable`, toggle with `<leader>cF`)
- **Completion:** blink.cmp (v1.x) with enter-to-accept preset
- **Keymaps:** Use `require("util").keymap()` wrapper which defaults to `noremap`, `nowait`, `silent`

## Adding a new LSP server

1. Create `lsp/<server_name>.lua` with the server config table
2. Add the server name to the `vim.lsp.enable()` list in `lua/config/lsp.lua`

## Adding a new plugin

Create `lua/plugins/<name>.lua` returning a lazy.nvim spec table. It will be auto-imported.
