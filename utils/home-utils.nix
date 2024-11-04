{ inputs }:
let
  inherit (inputs.self) outputs;
  shared-utils = (import ./shared-utils.nix) {
    inherit inputs;
  };
in
{
  mkHome = system: config:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = shared-utils.pkgsFor."${system}";
      extraSpecialArgs = {
        inherit inputs outputs;
      };
      modules = [ config ];
    };
}
