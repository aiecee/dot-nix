{ inputs }:

{
  nixos = import ./nixos-utils.nix { inherit inputs; };
  home-manager = import ./home-utils.nix { inherit inputs; };
  shared = import ./shared-utils.nix { inherit inputs; };
}
