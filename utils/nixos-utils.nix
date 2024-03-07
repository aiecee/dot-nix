{ inputs }:
let
  inherit (inputs.self) outputs;
in
{
  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs;
      };
      modules = [
        config
      ];
    };
}
