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
    ./zellij.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    exa
    ripgrep
    fd
    jq

    nixpkgs-fmt
  ];

}
