# neovim-config

## Screenshot
![image](https://github.com/brianhuster/neovim-config/assets/111893501/3ec40738-e6fc-4a39-9109-c19148235037)

## Plugins

The configuration includes the following plugins:

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): For improved syntax highlighting and code navigation.
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): A beautiful dark theme for Neovim.
- [nvim-tree/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A file explorer tree.
- [nvim-tree/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): For file specific icons in the file explorer.
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline): A status/tabline for Neovim.
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes): Themes for vim-airline.
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim): An intellisense engine for Neovim.
- [github/copilot.vim](https://github.com/github/copilot.vim): GitHub Copilot for Neovim.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): A comment toggler for Neovim.
- [prettier/vim-prettier](https://github.com/prettier/vim-prettier): A code formatter for Neovim.

## Keybindings

The configuration includes the following custom keybindings:

- `gd`: Go to definition (Coc)
- `gy`: Go to type definition (Coc)
- `gr`: Go to references (Coc)
- `[g`: Go to previous diagnostic (Coc)
- `]g`: Go to next diagnostic (Coc)
- `<space>s`: Show symbols (Coc)
- `<space>d`: Show diagnostics (Coc)
- `<leader>do`: Do code action (Coc)
- `<leader>rn`: Rename (Coc)
- `Alt+T`: Open terminal in split window
- `x`: Delete without copying to clipboard
- `Alt+A`: Select all
- `Ctrl+P`: Format code with Prettier

For other keybindings set by plugins, please go to their Github repositories for more information.

## General Settings

The configuration also includes several general settings to improve the Neovim experience, such as enabling mouse support, line numbers, auto-indentation, and more.
