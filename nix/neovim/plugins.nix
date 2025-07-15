{ pkgs }:

(import ./plugins/core.nix { inherit pkgs; }) ++
(import ./plugins/ui.nix { inherit pkgs; }) ++
(import ./plugins/theme.nix { inherit pkgs; }) ++
(import ./plugins/notifications.nix { inherit pkgs; }) ++
(import ./plugins/editor.nix { inherit pkgs; }) ++
(import ./plugins/lsp.nix { inherit pkgs; }) ++
(import ./plugins/completion.nix { inherit pkgs; }) ++
(import ./plugins/snippets.nix { inherit pkgs; }) ++
(import ./plugins/formatting.nix { inherit pkgs; }) ++
(import ./plugins/git.nix { inherit pkgs; }) ++
(import ./plugins/tools.nix { inherit pkgs; })