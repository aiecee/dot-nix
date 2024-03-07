{ inputs }:
let
  inherit (inputs.nixpkgs) lib;
  systems = [
    "aarch64-linux"
    "x86_64-linux"
  ];
  utils = import ./shared-utils.nix { inherit inputs; };
in
{
  pkgsFor = lib.genAttrs systems (system: import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  });
  forAllSystems = f: lib.genAttrs systems (system: f utils.pkgsFor.${system});
}
