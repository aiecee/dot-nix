{ lib, config, ... }:
let
  cfg = config.rice.gtk;
in
{
  imports = [
    ../shared/gtktheme.nix
  ];

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        package = cfg.package;
        name = cfg.name;
      };
    };
    services.xsettingsd = {
      enable = true;
      settings = {
        "Net/ThemeName" = "${cfg.name}";
      };
    };
  };
}
