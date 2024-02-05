{ lib, ... }:
let
  inherit (lib) mkEnableOption mkOption types;
in 
{
  options.rice.cursor = {
    enable = mkEnableOption "Enable custom cursors";
    package = mkOption {
      type = types.nullOr types.package;
      default = null;
      description = "Package providing the cursor theme";
    };
    name = mkOption {
      type = types.str;
      description = "Name of the cursor theme in the package";
    };
    size = mkOption {
      type = types.int;
      default = 24;
      description = "Size of the cursor";
    };
  };
}
