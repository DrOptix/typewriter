# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

### Added

- Lua LSP support, trough `lua_ls`
- Rust LSP support, trough `rust_analyzer`

- Setup DAP support for C#

  - Launching a C# project (build and attach)
  - Attaching to a running process

- Available DAP keybindings

  - In `normal` mode, `F5`: Start/Continue binary debugging
  - In `normal` mode, `F10`: Step over function
  - In `normal` mode, `F11`: Step into function
  - In `normal` mode, `Ctrl+F11`: Step out of current function
  - In `normal` mode, `<LEADER>b`: Add/Remove breakpoint on current line
  - In `normal` mode, `<LEADER>B`: Set contitional breakpoint on current line
  - In `normal` mode, `<LEADER>bl`: Set log point breakpoint on current line
  - In `normal` mode, `<LEADER>dr`: Open the REPL console of underling debugger
  - In `normal` mode, `<LEADER>f`: Format the current buffer.
  - In `normal` mode, `<LEADER>k`: Show documentation for the symbol under
    cursor.

### Fixed

- Increase split horizontal size used now `2` units instead of `1`, making it
  consistent with the other split resize steps.

## [v0.6.0] - 2024-12-20

### Added

- Add LSP support for C#

- In `normal` mode, `gr`: Lists LSP references for word under the cursor

- In `normal` mode, `gd`: Goto the definition of the word under the cursor, if
  there's only one, otherwise show all options in `telescope`

- In `normal` mode, `gi`: Goto the implementation of the word under the cursor
  if there's only one, otherwise show all options in `telescope`"

- In `normal` mode, `<LEADER>rs`, Restart LSP

## [v0.5.0] - 2024-11-21

### Added

- Add `treesitter` parser for `lua`
- Add `gruvbox` theme for `neovim`

- While in `telescope` popup

  - In `normal` mode, close the popup with `q`
  - In `insert` mode, close the popup with `Ctrl+Q`

- While in `telescope` buffers popup

  - In `normal` mode, delete buffer using `d`
  - In `insert` mode, delete buffer using `Ctrl+D`

- Ignore the content of `.git` directory in `telescope`

- Add completion for word present in current buffers using `nvim-cmp` and
  `cmp-buffer` plugins

- Add completion for file paths using `nvim-cmp` and `cmp-path` plugins. While
  open the completion popup shows a preview of the file.

- Completion for commands, `:`, using `nvim-cmp` and `cmp-cmdline` and
  `cmp-path` as sources.

- Completion for search, `/`, using `nvim-cmp` and `cmp-cmdline` and
  `cmd-buffer` as sources.

- `C-k`: Select previous completion option
- `C-j`: Select next completion option
- `C-b`: Scroll up 4 lines in documentatio preview
- `C-f`: Scroll down 4 lines in documentatio preview
- `C-Space`: Accept current selection
- `C-e`: Close completion menu
- `CR`: Accept current competion option

### Changed

- Set `gruvbox` theme for `lualine`

### Fixed

- Include hidden files when using `telescope` find files (`<LEADER>ff`)

### Removed

- Remove `smart` path display in `telescope` as it is confusing

## [v0.4.0] - 2024-11-18

### Added

- Better status line, using `lualine`.
- Show edit mode in status line
- Show git branch in status line
- Show file name in status line
- Show lazy plugins update count
- Show encoding in status line
- Show file type in status line
- Show file scroll amount in percentages
- Show current line and column
- Use Nord theme for the status line
- Mark idents using `┊` symbol
- Add TODO highlighting using `todo-comments` plugin
- `]t` Jump to next TODO
- `[t` Jump to previous TODO
- Friendly welcome screen when opening `neovim`

- Syntax highlighting for C#, Markdown, JSON, YAML, Dockerfiles, gitignore,
  Bash and Fish

## [v0.3.0] - 2024-11-17

### Added

- Add `Lazy.nvim` plugin manager
- `<LEADER>ff` - Find files in current working directory using `telescope`
- `<LEADER>fs` - Find string in current working directory using `telescope`

- `<LEADER>fc` - Find string under cursor in current working directory using
  `telescope`

- `<LEADER>fb` - Fuzzy find open buffers using `telescope`
- `<LEADER>fk` - Fuzzy find keybindings using `telescope`
- In `telescope` window, `Ctrl+J` - Go to next selection
- In `telescope` window, `Ctrl+K` - Go to previous selection
- Add mention `telescope-fzf-native` build dependency in README.md

### Tests

- Install `git` in test containers
- Install `ca-cerfificates` in Ubuntu test containers
- Install `make` in Ubuntu test containers
- Install `gcc` in Ubuntu test containers
- Install `libc6-dev` in Ubuntu test containers
- Add test container for Ubuntu 24.04

## [v0.2.1] - 2024-11-17

### Fixed

- Links to versions diff in CHANGELOG

## [v0.2.0] - 2024-11-17

### Added

- Set leader to ` `. It is the space key.

- `<LEADER>sv` - Split window veritcally
- `<LEADER>sh` - Split window horizontally
- `<LEADER>se` - Make splits to be of equal size
- `<LEADER>sx` - Close current split

- `<LEADER>to` - Open new tab
- `<LEADER>tx` - Close current tab
- `<LEADER>tn` - Go to next tab
- `<LEADER>tp` - Go to previous tab

- `Shift+H` - Decrease split horizontal size
- `Shift+L` - Increase split horizontal size
- `Shift+J` - Increase split vertical size
- `Shift+K` - Decrease split vertical size

- `<LEADER>nh` - Clear search highlights

### Tests

- Add test container for Fedora 41
- Add test container for Ubuntu 24.10

## [v0.1.0] - 2024-11-17

### Added

- `netrw`: Display files as a tree.
- Enable line numbers.
- Enable relative line numbers.
- Use spaces instead of tabs. Tab size is 4 spaces.
- Disable line wrapping.
- Search using first lowercase letter assumes case insesitive search.
- Search using first uppercase letter assumes case sensitive search.
- Highlight the current line.
- Set row limit indicator to 80 chars.
- Enable sign column, usefull to show indicators like breakpoints.
- Enable 24-bit RGB colors
- Enable dark color scheme for NeoVim
- Enable more user friendly backspace handling
- Integrate with system clipboard
- Vertical splits will go to the right of the current split
- Horizontal splits will go bellow the current split
- Add `-` as a keyword charater.

[unreleased]: https://github.com/DrOptix/typewriter/compare/v0.6.0...HEAD
[v0.6.0]: https://github.com/DrOptix/typewriter/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/DrOptix/typewriter/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/DrOptix/typewriter/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/DrOptix/typewriter/compare/v0.2.1...v0.3.0
[v0.2.1]: https://github.com/DrOptix/typewriter/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/DrOptix/typewriter/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/DrOptix/typewriter/releases/tag/v0.1.0
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html
