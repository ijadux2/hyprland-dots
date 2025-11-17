# Neovim Configuration

This is a Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim), customized for personal use within the sway-dots repository.

## Features

- **LazyVim Base**: Built on LazyVim v8 for a modern, performant Neovim experience.
- **AI Integration**: Includes Copilot and Copilot Chat for AI-assisted coding.
- **Coding Tools**: Enhanced with mini-surround, yanky, dial, and incremental rename for efficient editing.
- **Language Support**: Extended support for Git, Markdown, Nix, Nushell, Python, TOML, YAML, and Zig.
- **LSP and Testing**: Neoconf for LSP configuration and core testing plugins.
- **Theme**: Catppuccin Mocha theme with integrations for cmp, gitsigns, nvimtree, treesitter, and telescope.
- **Formatting**: Stylua for Lua code formatting.

## Installation

1. Ensure you have Neovim installed (version 0.9+ recommended).
2. Clone or copy this configuration to your Neovim config directory (usually `~/.config/nvim`).
3. Install the plugins by running `:Lazy sync` in Neovim.

## Usage

- Start Neovim as usual.
- The configuration loads automatically with LazyVim defaults plus the customizations.
- Use `<leader>` (space by default) for various commands and plugins.

## Customization

- Edit `lua/config/options.lua` for Neovim options.
- Add keymaps in `lua/config/keymaps.lua`.
- Modify autocmds in `lua/config/autocmds.lua`.
- Add or override plugins in `lua/plugins/`.
- Update LazyVim extras in `lazyvim.json`.

## Requirements

- Neovim 0.9+
- Git for plugin management
- Internet connection for initial plugin downloads

## License

This configuration is provided as-is for personal use.
