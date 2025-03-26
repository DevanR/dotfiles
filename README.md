# Dotfiles

My personal dotfiles managed with Dotbot, supporting both Vim and Neovim.

## Contents

- **Zsh**: Primary shell configuration files (with bash compatibility)
- **Bash**: Secondary shell configuration files (for compatibility)
- **Vim**: Traditional Vim configuration and plugins
- **Neovim**: Modern Neovim configuration with LSP support
- **Tmux**: Terminal multiplexer configuration

## Installation

1. Clone this repository:
   ```bash
   git clone --recursive https://github.com/devanr/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the install script:
   ```bash
   ./install
   ```

## File Structure

```
dotfiles/
├── zsh/
│   ├── zshrc
│   └── zprofile
├── bash/
│   ├── bash_profile
│   ├── bashrc
│   ├── bash_aliases
│   ├── bash_functions
│   └── bash_local.template
├── vim/
│   ├── vimrc
│   ├── gvimrc
│   ├── ftdetect/
│   └── syntax/
├── nvim/
│   ├── init.vim
│   ├── lua/
│   ├── ftdetect/
│   └── syntax/
├── tmux/
│   └── tmux.conf
├── install.conf.yaml
├── install
├── .gitignore
└── README.md
```

## Component Overviews

### Shell Configuration

The configuration supports both Zsh (primary) and Bash (secondary):

#### Zsh Configuration
- `zshrc`: Non-login shell configuration
- `zprofile`: Login shell configuration
- Includes compatibility layer for Bash commands
- Modern shell features and improved completion

#### Bash Configuration (for compatibility)
- `bash_profile`: Login shell configuration
- `bashrc`: Non-login shell configuration
- `bash_aliases`: All aliases
- `bash_functions`: All functions
- `bash_local.template`: Template for machine-specific settings

Features:
- Clean prompt with git integration
- Useful aliases for common operations
- Helper functions for productivity
- Support for local customizations
- Full compatibility with existing Bash commands

### Vim Configuration

A traditional Vim setup with modern plugins:
- Plugin management with vim-plug
- Syntax highlighting and linting
- File navigation and fuzzy finding
- Git integration
- Code completion

### Neovim Configuration

An enhanced Neovim setup that builds upon Vim:
- Modern LSP (Language Server Protocol) integration
- Tree-sitter for improved syntax highlighting
- Native terminal support
- Lua-based plugin configurations
- Auto-completion with nvim-cmp

After installation, open Neovim and run:
```
:PlugInstall
:TSUpdate
```

Key plugins:
- nvim-treesitter for better syntax highlighting
- nvim-lspconfig for Language Server integration
- nvim-cmp for advanced autocompletion
- fzf/telescope for fuzzy finding
- Plus all traditional Vim plugins

### Tmux Configuration

Modern tmux configuration with:
- Vi-style keybindings
- Mouse support
- Custom status bar
- Intuitive window and pane management
- Plugin support

## Customization

### Machine-Specific Settings

Create a `~/.bash_local` file for machine-specific bash settings. This file is automatically sourced if it exists.

### Neovim LSP

To add additional language servers to Neovim:

1. Install the language server:
   ```bash
   # Example: Python
   pip install pyright
   
   # Example: JavaScript/TypeScript
   npm install -g typescript typescript-language-server
   ```

2. Add the configuration to `~/.config/nvim/lua/plugins.lua`:
   ```lua
   -- Example for adding Ruby language server
   lspconfig.solargraph.setup{}
   ```

## Updating

To update your dotfiles:

1. Pull the latest changes:
   ```bash
   cd ~/dotfiles
   git pull
   ```

2. Run the installer again:
   ```bash
   ./install
   ```

## Adding New Dotfiles

1. Add your new configuration file to the appropriate directory
2. Update `install.conf.yaml` to include the symlink
3. Run `./install` to create the symlink

## Troubleshooting

### Vim Plugin Installation Issues

If you encounter errors during plugin installation:

1. Try installing plugins manually:
   ```
   vim +PlugInstall +qall
   ```
   
2. For Neovim, use:
   ```
   nvim +PlugInstall +qall
   ```

3. Check for errors when starting Vim/Neovim without plugins:
   ```
   vim -u NONE
   nvim -u NONE
   ```

### Common Issues

- **PATH issues**: Make sure required tools are in your PATH
- **Permissions**: Ensure all directories have proper permissions
- **Missing dependencies**: Some plugins require external tools

## License

This project is licensed under the MIT License - see the LICENSE file for details.
