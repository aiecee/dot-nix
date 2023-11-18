{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./sddm.nix
    ./zsh.nix
  ];
}
