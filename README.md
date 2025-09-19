# Neovim

My config files for Neovim.

Using Neovim's built in LSP- and Package-manager.

LSP requires manual installation of the following installation of:

- lua-language-server
- clangd
- bash-language-server
- pyright
- typescript-language-server typescript
- vscode-langservers-extracted
- tailwindcss-language-server
- yaml-language-server
- rust-analyzer
- tinymist
- haskell-language-server
- nil
- docker-langserver

Install of them on Arch (requires yay)

```
sudo pacman -S --needed --noconfirm \
  lua-language-server \
  clang \
  rust-analyzer \
  haskell-language-server \
  nodejs \
  npm \
  cargo \
  pyright \
  typescript \
  typescript-language-server \
  tailwindcss-language-server \
  yaml-language-server \
  bash-language-server

yay -S --needed --noconfirm \
  jdtls \
  nil \
  tinymist-git \
  vscode-langservers-extracted \
  dockerfile-language-server

```

And for the formatters used are

- stylua
- prettierd
- prettier
- google-java-format
- ktlint
- rustfmt
- clang_format

```
sudo pacman -S --needed --noconfirm \
  stylua \
  prettier \
  ktlint \
  clang

yay -S --needed --noconfirm \
  google-java-format \
  rustfmt \
  prettierd \
  google-java-format \
  yamlfix \
  beautysh
```
