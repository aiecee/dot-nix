{ inputs, pkgs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./usb.nix
    ./zsh.nix
    ../../../shared/fonts.nix
  ] ++ (builtins.attrValues outputs.nixosModules);


  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.system}.default
  ];
}
