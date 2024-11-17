# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

### Tests

- Add test container for Fedora 41
- Add test container for Ubuntu 24.10

## [0.1.0] - 2024-11-07

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
