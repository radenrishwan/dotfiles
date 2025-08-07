{ pkgs }:

with pkgs; [
  lua-language-server
  gopls
  clang-tools
  rust-analyzer
  nodePackages.typescript-language-server
  nodePackages.eslint
  vscode-langservers-extracted  # jsonls, cssls, htmlls
  tailwindcss-language-server
  emmet-ls

  stylua
  gotools

  gnumake
  git

] ++ (if pkgs.stdenv.isDarwin then [
    # add a xclip mac later
] else [
  xclip
  wl-clipboard
])
