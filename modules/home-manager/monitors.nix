{ lib, config, ... }:

let
  inherit (lib) mkOption mkEnableOption types;
  cfg = config.monitors;
in
{
  options.monitors = mkOption {
    description = "Monitors to configure";
    type = types.lazyAttrsOf
      (types.submodule {
        options = {
          primary = mkOption {
            type = types.bool;
            default = false;
          };
          width = mkOption {
            type = types.int;
            example = 1920;
          };
          height = mkOption {
            type = types.int;
            example = 1080;
          };
          refreshRate = mkOption {
            type = types.int;
            default = 60;
          };
          x = mkOption {
            type = types.int;
            default = 0;
          };
          y = mkOption {
            type = types.int;
            default = 0;
          };
          defaultWorkspace = mkOption {
            type = types.int;
          };
        };
      });
    default = { };
  };

  config = { };

}
