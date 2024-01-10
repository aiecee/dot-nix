{ inputs, pkgs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./environment.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./zsh.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  environment.systemPackages =  [
    inputs.home-manager.packages.${pkgs.system}.default
  ];
}
