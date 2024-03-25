{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./direnv.nix
    ./git.nix
    ./lf.nix
    ./pfetch.nix
    ./starship
    ./ssh.nix
    ./zellij.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    age
    sops

    eza
    ripgrep
    fd
    jq
    diskonaut
    neofetch
    lazygit
    unstable.ollama

    nix-du
    nix-stray-roots
    nix-tree
  ];

}
