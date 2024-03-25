{ inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.age.keyFile = ~/.config/sops/age/keys.txt;
}
