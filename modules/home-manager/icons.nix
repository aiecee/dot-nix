{ lib, config, ... }:
let
  cfg = config.rice.icons;
in
{
  imports = [
    ../shared/icons.nix
  ];

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      iconTheme = {
        package = cfg.packages;
        name = cfg.name;
      };
    };
  };
}
