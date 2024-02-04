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
  };
}
