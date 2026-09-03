# Neovim Profile

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的个人 Neovim 配置，面向 Rust 开发，并保留简洁的文件浏览、搜索、Git 集成和跨 Tmux 窗口导航体验。

## 功能

- LazyVim 提供 LSP、补全、Telescope、Git 标记、状态栏、注释、自动配对和 `which-key` 快捷键提示。
- Rust 开发环境使用 `rustaceanvim`、`rust-analyzer`、`crates.nvim`、Rust Treesitter 和 `codelldb` 调试器。
- `nvim-tree.lua` 作为文件浏览器，主题为 Onedark Pro。
- `vim-tmux-navigator` 统一 Neovim 与 Tmux 的窗格切换。
- `lazy-lock.json` 锁定已验证的插件版本，保证不同机器上的安装结果一致。

## 前置条件

- Neovim `>= 0.11`
- Git
- Rust 工具链（`cargo`、`rustc`）
- C 编译器，用于编译 Treesitter 解析器
- [Nerd Font](https://www.nerdfonts.com/)（推荐，用于图标显示）
- Tmux（可选，仅在需要跨 Tmux 窗格切换时安装）

首次启动时，lazy.nvim 会安装插件；Mason 会安装 `rust-analyzer`、`codelldb` 和 `tree-sitter-cli`。首次安装需要网络连接，完成时间取决于网络和本机编译环境。

## 安装

如果已经存在 `~/.config/nvim`，请先自行备份该目录。随后执行：

```bash
git clone https://github.com/ZombieCoke/neovim_profile_ZombieCoke.git ~/.config/nvim
nvim
```

首次启动完成后，可用以下命令检查状态：

```vim
:Lazy
:Mason
:checkhealth
```

## 快捷键

`<leader>` 默认为空格。停顿片刻即可由 `which-key` 显示当前上下文可用的快捷键。

| 快捷键 | 作用 |
| --- | --- |
| `<leader>e` | 打开或关闭文件浏览器 |
| `<C-h>` | 切换到左侧 Neovim 窗口或 Tmux 窗格 |
| `<C-j>` | 切换到下侧 Neovim 窗口或 Tmux 窗格 |
| `<C-k>` | 切换到上侧 Neovim 窗口或 Tmux 窗格 |
| `<C-l>` | 切换到右侧 Neovim 窗口或 Tmux 窗格 |
| `<C-\\>` | 在当前与上一个 Neovim 窗口或 Tmux 窗格间切换 |
| `<leader>cR` | Rust 代码操作，仅在 Rust 缓冲区可用 |
| `<leader>dr` | 选择 Rust 可调试目标，仅在 Rust 缓冲区可用 |

## 配置结构

| 路径 | 职责 |
| --- | --- |
| `init.lua` | 配置入口 |
| `lua/config/lazy.lua` | lazy.nvim 引导与 LazyVim 加载 |
| `lua/config/options.lua` | Neovim 选项 |
| `lua/config/keymaps.lua` | 项目级快捷键扩展 |
| `lua/config/autocmds.lua` | 自动命令扩展 |
| `lua/plugins/development.lua` | Rust、文件树、主题与 Tmux 导航插件声明 |
| `lazy-lock.json` | 插件版本锁定文件 |

LazyVim 已覆盖大多数通用功能。新增插件或覆写现有插件时，优先在 `lua/plugins/` 中新增独立 Lua 文件，避免改动启动逻辑。

## Rust 工作流

打开含 `Cargo.toml` 的项目后，`rustaceanvim` 会启动 `rust-analyzer`。配置启用了完整 Cargo feature、构建脚本、过程宏，以及保存时的 Rust Analyzer 诊断；`crates.nvim` 为 `Cargo.toml` 提供 crate 信息、补全和操作。

调试时，Rust extra 使用 Mason 安装的 `codelldb`。在 Rust 缓冲区运行 `<leader>dr`，即可选择 Cargo 提供的可调试目标。

## 更新与维护

```vim
:Lazy update
:Mason
:TSUpdate
```

更新插件后，审阅 `lazy-lock.json` 的变更并提交该文件。若 Rust 工具无法启动，先在 `:Mason` 中确认 `rust-analyzer` 和 `codelldb` 已安装，再执行 `:checkhealth`。

## 本地与敏感配置

不要将 token、密码、私钥、`.env` 文件或机器专属配置提交到仓库。`.gitignore` 已排除常见敏感文件、`lazyvim.json` 以及 `lua/plugins/local.lua`。需要本机专属插件覆写时，可在 `lua/plugins/local.lua` 中创建配置；该文件会被 LazyVim 自动加载，但不会被 Git 跟踪。

## 许可证

[Apache-2.0](LICENSE)
