# Claude Code Instructions

## Repository Overview
Personal dotfiles for macOS and Linux. Uses GNU Stow for symlink management.

## Key Directories
- `nvim/` - Neovim configuration (lazy.nvim plugin manager)
- `zsh/` - Zsh configuration
- `tmux/` - Tmux configuration
- `kitty/` - Kitty terminal configuration
- `i3/` - i3 window manager (Linux)
- `polybar/` - Polybar status bar (Linux)

## Neovim Configuration Preferences

### General Principles
- Prefer native Neovim 0.11+ features over plugins when possible
- Use `vim.lsp.buf.*` functions instead of telescope for LSP navigation
- Keep configurations minimal - avoid over-engineering
- Check `:checkhealth vim.deprecated` and use modern APIs

### Plugin Preferences
- **Completion**: blink.cmp (not nvim-cmp)
- **Formatting**: conform.nvim with biome (fallback to prettier)
- **LSP**: nvim-lspconfig + mason.nvim
- **File explorer**: oil.nvim
- **Fuzzy finder**: telescope.nvim (for files/grep, NOT for LSP)
- **AI**: avante.nvim (Claude) + supermaven

### LSP Configuration
- ESLint: diagnostics only, no auto-fix on save (formatting handled by biome/prettier)
- TypeScript: typescript-tools.nvim
- Python: pyright only (not pylsp)
- Go: gopls with staticcheck and gofumpt
- Rust: rust_analyzer with clippy on save

### Formatting Order (conform.nvim)
- JS/TS: biome → prettierd → prettier (stop_after_first)
- Formatting on save enabled

### Code Action Order Preference
When suggesting code actions: typescript-tools > eslint > biome

## Zsh Configuration

### Secrets Management
- API keys and secrets go in `~/.zshrc.local` (not tracked)
- `.zshrc` sources `.zshrc.local` if it exists
- Never commit API keys to the repository

## Commit Conventions
- Keep commits focused and atomic
- Use conventional commit messages when appropriate
