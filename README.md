# Dotfiles

This repository contains my personal dotfiles, managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Contents

- **Bash**: Shell configuration files
- **Vim**: Vim configuration and plugins
- **Tmux**: Tmux configuration

## Installation

1. Clone this repository:

```bash
git clone https://github.com/username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the install script:

```bash
./install
```

## File Structure

```
dotfiles/
├── bash/
│   ├── bash_profile
│   ├── bashrc
│   ├── bash_aliases
│   └── bash_functions
├── tmux/
│   └── tmux.conf
├── vim/
│   ├── vimrc
│   └── gvimrc
├── install.conf.yaml
├── install
└── README.md
```

## Customization

You can customize your settings for specific machines by creating a `~/.bash_local` file, which will be automatically sourced if it exists.

## Updating

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
./install
```

## Adding New Files

1. Add new dotfiles to the appropriate directory
2. Update `install.conf.yaml` to create a symlink for the new file
3. Run `./install` to create the new symlinks

## Components

### Bash

The bash configuration is organized into several files:
- `bash_profile`: Login shell configuration
- `bashrc`: Non-login shell configuration
- `bash_aliases`: All aliases
- `bash_functions`: All functions

### Vim

The Vim configuration uses vim-plug for plugin management and includes:
- Modern development plugins
- Syntax highlighting and linting
- Fuzzy file finding with FZF
- Git integration
- Code formatting

### Tmux

The Tmux configuration includes:
- Vim-like keybindings
- Mouse support
- Custom status bar
- Improved colors
- Sensible defaults

## License

This project is licensed under the MIT License - see the LICENSE file for details.
