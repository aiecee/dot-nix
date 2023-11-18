{ inputs, pkgs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./sddm.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.home-manager.packages.${pkgs.system}.default
    catppuccin-sddm
  ];
}
