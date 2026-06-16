# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a Linux / Wayland desktop. The repo mirrors `$HOME`: paths in the
repo (`.config/...`, `.tmux.conf`) correspond directly to their location under the home
directory. There is no build step, no install script, and no tests — edits take effect when
the relevant program reloads its config.

## Reloading config after edits

Most tools must be told to re-read their config; there is no global "apply":

- **Hyprland**: `hyprctl reload` (also bound to `SUPER+SHIFT+R`).
- **tmux**: `prefix` then `r` (rebound to `source-file ~/.tmux.conf`).
- **Neovim**: restart, or `:Lazy sync` after changing plugin specs. `lazy-lock.json` pins
  plugin commits — commit it alongside plugin changes.
- **waybar / wofi / ghostty**: restart the program.

## Theming

Everything is **Catppuccin Mocha**. When adding or restyling a component, match this palette
rather than introducing new colors. The accent blue used across borders is `#b4befe`.
Hyprland colors are sourced from `.config/hypr/mocha.conf`.

## Neovim architecture

- `init.lua` bootstraps **lazy.nvim**, sets core options (2-space expandtab, relative
  numbers), `<leader>` = space, then loads every file under `lua/plugins/` via
  `{ import = "plugins" }`.
- Each file in `lua/plugins/` returns a lazy.nvim plugin spec (a table). To add a plugin,
  create a new file there returning a spec — do not edit a central list.
- **LSP** (`lsp-config.lua`): servers are installed via mason + mason-lspconfig
  (`ensure_installed`: cssls, lua_ls, rust_analyzer, cmake). Keymaps `K` hover, `gd`
  definition, `<leader>ca` code action, `<leader>e[n/p]` diagnostics.
- **Formatting / linting** (`none-ls.lua`): none-ls with `prettierd` (format) and
  `eslint_d` (diagnostics). `<leader>gf` formats via `vim.lsp.buf.format`.
- **REPLs**: `iron.lua` (general REPLs — sh/zsh, python3) and `supercollider.lua` (scnvim
  for live-coding audio). These define their own send-to-REPL keymaps.

## Notes

- Multiple terminal emulators are configured (ghostty, kitty, alacritty); **ghostty** is the
  active one (`$terminal` in `hyprland.conf`). Keep changes consistent if editing several.
- `.config/ghostty/#config#` is a stray Emacs autosave artifact — do not edit or commit it;
  it can be deleted.
