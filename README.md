# Hermann NVIM

A powerful and extensible Neovim configuration designed for modern development workflows.

## Overview

Hermann NVIM is a carefully crafted Neovim configuration that provides a robust development environment with sensible defaults, powerful plugins, and efficient keybindings. Built for developers who want a productive coding experience without sacrificing performance.

## Features

- 🚀 **Fast Startup** - Optimized lazy loading for quick boot times
- 🎨 **Modern UI** - Beautiful themes and statusline configurations
- 🔍 **Intelligent Search** - Fuzzy finding with Telescope integration
- 📝 **Smart Completion** - LSP-powered autocompletion and diagnostics
- 🛠️ **Development Tools** - Integrated debugger, formatter, and linter support
- 📁 **File Management** - Efficient file explorer and navigation
- ⚡ **Git Integration** - Built-in Git workflow support
- 🔧 **Extensible** - Easy to customize and extend

## Requirements

- Neovim >= 0.8.0
- Git
- Node.js >= 16.0 (for LSP servers)
- A Nerd Font (recommended: JetBrains Mono Nerd Font)

## Installation

### Quick Install

```bash
# Clone Hermann NVIM
git clone <repository-url> ~/.config/hvim

# Start Neovim
NVIM_APPNAME=hvim nvim
```

### Manual Setup

1. Clone the repository:
   ```bash
   git clone <repository-url> ~/.local/share/hermann-nvim
   ```

2. Create symlink:
   ```bash
   ln -s ~/.local/share/hermann-nvim ~/.config/hvim
   ```

3. Install dependencies and start Neovim:
   ```bash
   NVIM_APPNAME=hvim nvim +Lazy update
   ```

## Configuration

### Basic Customization

Create a `lua/user/init.lua` file for personal customizations:

```lua
-- Example user configuration
return {
  colorscheme = "tokyonight",
  leader_key = " ",
  
  -- LSP servers to install
  lsp_servers = {
    "lua_ls",
    "tsserver",
    "pyright",
  },
  
  -- Custom keybindings
  keybindings = {
    -- Add your custom keybindings here
  }
}
```

### Plugin Management

Hermann NVIM uses lazy.nvim for plugin management. Add custom plugins in `lua/plugins/user.lua`:

```lua
return {
  {
    "author/plugin-name",
    config = function()
      -- Plugin configuration
    end
  }
}
```

## Usage

### Key Bindings

| Key | Action | Mode |
|-----|--------|------|
| `<leader>ff` | Find files | Normal |
| `<leader>fg` | Live grep | Normal |
| `<leader>fb` | Find buffers | Normal |
| `<leader>e` | Toggle file explorer | Normal |
| `<leader>gg` | Git status | Normal |

### Language Support

Hermann NVIM includes built-in support for:

- **Web Development**: TypeScript, JavaScript, HTML, CSS
- **Systems Programming**: Rust, Go, C/C++
- **Scripting**: Python, Lua, Bash
- **Configuration**: YAML, JSON, TOML
- **Documentation**: Markdown, LaTeX

## Troubleshooting

### Common Issues

**Slow startup time:**
```bash
# Check startup time
nvim --startuptime startup.log

# Profile plugins
:PackerProfile
```

**LSP not working:**
```bash
# Check LSP status
:LspInfo

# Install language servers
:MasonInstall <server-name>
```

**Plugin errors:**
```bash
# Clean and reinstall plugins
:PackerClean
:PackerSync
```

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a merge request

### Development Setup

```bash
# Clone for development
git clone <repository-url>
cd hermann-nvim

# Install development dependencies
npm install  # or yarn install

# Run tests
make test
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Neovim](https://neovim.io/) - The extensible text editor
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- Community contributors and plugin authors

## Support

- 📖 **Documentation**: Check the [wiki](wiki) for detailed guides
- 🐛 **Issues**: Report bugs in the [issue tracker](issues)
- 💬 **Discussions**: Join community discussions in [discussions](discussions)

---

**Made with ❤️ for the Neovim community**
