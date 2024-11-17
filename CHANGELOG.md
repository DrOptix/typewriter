# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Add `Lazy.nvim` plugin manager
- `<LEADER>ff` - Find files in current working directory
- `<LEADER>fs` - Find string in current working directory
- `<LEADER>fc` - Find string under cursor in current working directory
- `<LEADER>fb` - Fuzzy find open buffers
- `<LEADER>fk` - Fuzzy find keybindings
- In `telescope`, `Ctrl+J` - Go to next selection
- In `telescope`, `Ctrl+K` - Go to previous selection
- Add mention about `git` dependency in README.md

### Tests

- Install `git` in test containers

## [v0.2.1] - 2024-11-17

### Fixed

- Link to versions diff in CHANGELOG

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

[unreleased]: https://github.com/DrOptix/typewriter/compare/v0.2.1...HEAD
[v0.2.1]: https://github.com/DrOptix/typewriter/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/DrOptix/typewriter/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/DrOptix/typewriter/releases/tag/v0.1.0
