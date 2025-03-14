# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to [SemVer].

## [unreleased]

### Added

- Replace `netrw` with `nvim-tree` ([PR 6])

  - `<LEADER>e` to toggle the file tree on or off
  - `q` to close the file tree
  - `o` open a file in the editor or expand a directory in the tree
  - `d` to delete a file
  - `r` to rename a file or directory
  - `c` to copy a file or directory
  - `x` to cut a file or directory
  - `p` paste a copy or cut file or directory
  - `y` to yank a file or directory name

- Add `<LEADER>rn` key binding to run a LSP based rename for the symbol under
  cursor

### Changed

- In `normal` mode, show hover info using `Shift+K` instead of `<LEADER>k`
- In `normal` mode, show signature info only when using `<LEADER>K`, but don't
  update it while typeing.
- Renamed module `me` to `typewriter` for internal consistency ([PR 5])

### Fixes

- Fix LSP based formatting, tested with C# and Rust code ([PR 2])

## [v0.8.0]

### Added

- In `visual` mode: `Shift+J` move selected lines down
- In `visual` mode: `Shift+K` move selected lines up

### Changed

- containers(fedora_41): Build and install Neovim v0.10.4
- containers(ubuntu_24.04): Build and install Neovim v0.10.4

- Update plugin `nvim-cmp` to `8c82d0b`
- Update plugin `nvim-dap` to `b768c8d`
- Update plugin `nvim-web-devicons` to `5740b73`
- Update plugin `nvim-lspconfig` to `8121483`
- Update plugin `nvim-treesitter` to `622a4a6`
- Update plugin `lazy.nvim` to `d8f26ef`

### Removed

- containers(ubuntu_24.10): Removed as it's redundant

- test(ubuntu_24.10): Removed as it's redundant

## [v0.7.0] - 2025-01-05

### Added

- Support for seamless navigation between `neovim` and `tmux` panes

  - In `normal` mode: `Ctrl+h` move left
  - In `normal` mode: `Ctrl+j` move down
  - In `normal` mode: `Ctrl+k` move up
  - In `normal` mode: `Ctrl+l` move right, this keybinding is used by default by
    `netrw` for `NetrwRefresh`, therefore we overwrite it to enable splits
    navigation for a `netrw` split as well.

- Lua LSP support, trough `lua_ls`
- Rust LSP support, trough `rust_analyzer`

- Setup DAP support

  - Launching a C# project (build and attach)
  - Attaching to a C# running process
  - Launching a Rust project (build and attach)
  - Attaching to a Rust running process

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
  - In `normal` mode, `<LEADER>K`: Show signature help and keep showing it as
    you type.

### Fixed

- Increase split horizontal size used now `2` units instead of `1`, making it
  consistent with the other split resize steps.

### Changed

- `Shift+H` Replaced by `Ctrl+Left`: Decrease split horizontal size
- `Shift+L` - Replaced by `Ctrl+Right`: Increase split horizontal size
- `Shift+J` - Replaced by `Ctrl+Down`: Increase split vertical size
- `Shift+K` - Replaced by `Ctrl+Up`: Decrease split vertical size

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

[unreleased]: https://github.com/DrOptix/typewriter/compare/v0.8.0...HEAD
[v0.8.0]: https://github.com/DrOptix/typewriter/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/DrOptix/typewriter/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/DrOptix/typewriter/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/DrOptix/typewriter/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/DrOptix/typewriter/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/DrOptix/typewriter/compare/v0.2.1...v0.3.0
[v0.2.1]: https://github.com/DrOptix/typewriter/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/DrOptix/typewriter/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/DrOptix/typewriter/releases/tag/v0.1.0
[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[SemVer]: https://semver.org/spec/v2.0.0.html
[PR 2]: https://github.com/DrOptix/typewriter/pull/2
[PR 5]: https://github.com/DrOptix/typewriter/pull/5
[PR 6]: https://github.com/DrOptix/typewriter/pull/6
