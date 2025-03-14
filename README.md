# typewriter

Opinionated NeoVim configuration

## Dependencies

Those are the dependencies not handled automatically.

- [neovim](https://github.com/neovim/neovim)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [git](https://git-scm.com/)
- [make](https://www.gnu.org/software/make/)
- [gcc](http://gcc.gnu.org)
- [glibc](https://www.gnu.org/software/libc/)
  - Fedora: `glibc-devel`
  - Ubuntu: `libc6-devel`
- [dotnet](https://github.com/dotnet/), for `C#` support
- [unzip](http://infozip.sourceforge.net)

## Install

1. Clone, copy, symlink this repository into `$HOME/.config/nvim/`.
2. Start `neovim` and it should start install plugins and tools.
3. Enjoy typewriting

## Development

1. Hack something
2. Run one of the testing environments from `./tests`
3. Once in the testing container play around with your newly hacked config to
   validate it.
