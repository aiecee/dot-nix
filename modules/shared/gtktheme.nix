{ lib, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  options.rice.gkt = {
    enable = mkEnableOption "Enable custom gtk theme";
    package = mkOption {
      type = types.nullOr types.package;
      default = null;
      description = "Package providing the gtk theme";
    };
    name = mkOption {
      type = types.str;
      description = "Name of the gtk theme in the package";
    };
  };
}
