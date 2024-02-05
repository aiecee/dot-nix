{ lib, config, ... }:
let
  cfg = config.rice.fonts;
in
{
  imports = [
    ../shared/fonts.nix
  ];

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [
      cfg.monospace.package
      cfg.serif.package
      cfg.sansSerif.package
      cfg.emoji.package
    ];
    gtk = {
      enable = true;
      font = {
        name = cfg.serif.family;
        package = cfg.serif.package;
        size = 12;
      };
    };
  };
}
