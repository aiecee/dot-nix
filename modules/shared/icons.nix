{ lib, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  options.rice.icons = {
    enable = mkEnableOption "Enable custom icon theme";
    package = mkOption {
      type = types.nullOr types.package;
      default = null;
      description = "Package providing the icon theme";
    };
    name = mkOption {
      type = types.str;
      description = "Name of the icon theme in the package";
    };
  };
}

