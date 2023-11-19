{ lib, config, ... }:

let
  inherit (lib) mkOption types;
  cfg = config.monitors;
in
{
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
      name = mkOption {
        type = types.str;
        example = "DP-1";
      };
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
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      workspaces = mkOption {
        type = types.listOf (types.str);
        default = [ ];
      };
    });
    default = [ ];
  };

  config = {
    assertions = [{
      assertion = ((lib.length config.monitors) != 0) ->
        ((lib.length (lib.filter (monitor: monitor.primary) config.monitors)) == 1);
      message = "Exactly one monitor must be set as primary!";
    }];
  };
}
