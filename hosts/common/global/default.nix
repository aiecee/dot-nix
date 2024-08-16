{ inputs, pkgs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./environment.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./sops.nix
    ./usb.nix
    ./zsh.nix
    ../../../shared/rose-pine-moon.nix
  ] ++ (builtins.attrValues outputs.nixosModules);


  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.backupFileExtension = "hm-backup";

  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.system}.default
  ];
}
