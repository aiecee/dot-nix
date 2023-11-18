{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./zsh.nix
  ];
}
