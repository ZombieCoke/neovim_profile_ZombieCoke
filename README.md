# neovim_profile_ZombieCoke

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim), tuned for Rust development and daily terminal work with tmux.

## Features

- **LazyVim base** with the Rust language extra (`lazyvim.plugins.extras.lang.rust`)
  - `rust-analyzer` LSP, configured through `mason.nvim`
  - `rustaceanvim` for Rust tooling integration
  - `crates.nvim` for managing dependency versions in `Cargo.toml`
  - Debugging support with mason-installed `codelldb`
- **File explorer**: [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua), toggled with `<leader>e`
- **Colorscheme**: [onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim) (`onedark`)
- **Vim/tmux navigation**: [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  - `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` move between Vim windows and tmux panes
  - `<C-\>` jumps to the previously visited window/pane
- **Tooling** (managed by mason): `rust-analyzer`, `codelldb`, `lua-language-server`, `stylua`, `shfmt`, `tree-sitter-cli`
- **Lockfile**: `lazy-lock.json` pins plugin versions for reproducible installs

## Requirements

- Neovim >= 0.11.2 built with **LuaJIT** (developed on Neovim 0.12.5)
- `git` — used by lazy.nvim to bootstrap itself and clone plugins
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- Optional: `tmux` for cross-pane navigation; a Rust toolchain (`cargo`, `rustc`) for real Rust work

## Installation

Back up any existing config first, then clone:

```bash
git clone git@github.com:ZombieCoke/neovim_profile_ZombieCoke.git ~/.config/nvim
```

No SSH key available? Use HTTPS:

```bash
git clone https://github.com/ZombieCoke/neovim_profile_ZombieCoke.git ~/.config/nvim
```

Start `nvim`. On first launch lazy.nvim installs all plugins, and mason installs the LSP/DAP tools (`rust-analyzer`, `codelldb`, ...).

## Usage

- Update plugins: `:Lazy update` (or `:Lazy sync` to apply the lockfile)
- Run diagnostics: `:checkhealth lazy` / `:checkhealth mason`
- Mason packages are version-pinned by `lazy-lock.json`; binaries live outside this repo under `~/.local/share/nvim/mason`

## Repository layout

```text
├── init.lua                      # entry point
├── lazy-lock.json                # plugin lockfile
├── stylua.toml                   # StyLua config for formatting Lua
├── .neoconf.json                 # neodev/neoconf LSP settings
├── lua/config/
│   ├── lazy.lua                  # lazy.nvim bootstrap & global options
│   ├── options.lua               # extra editor options (currently none)
│   ├── keymaps.lua               # extra keymaps (currently none)
│   └── autocmds.lua              # extra autocmds (currently none)
└── lua/plugins/
    └── development.lua           # Rust extra, nvim-tree, onedarkpro, tmux navigation
```

## Notes

- **Keep secrets out of this repo.** `.gitignore` excludes `.env*`, private keys (`*.key`, `*.pem`), `lazyvim.json`, and local overrides such as `lua/config/local.lua` and `lua/plugins/local.lua`. If you fork this, re-check the ignore rules before pushing.
- The three files under `lua/config/` are intentionally minimal placeholders where personal tweaks can live without touching the shared layout.

## License

[Apache-2.0](LICENSE)
