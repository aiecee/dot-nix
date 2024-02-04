{ lib, config, ... }:
let
  cfg = config.rice.fonts;
in
{
  imports = [
    ../shared/fonts.nix
  ];

  config = lib.mkIf cfg.enable
    {
      fonts = {
        packages = [
          cfg.monospace.package
          cfg.serif.package
          cfg.sansSerif.package
          cfg.emoji.package
        ];
        fontConfig = {
          enable = true;
          defaultFonts = {
            monospace = [ cfg.monospace.family ];
            serif = [ cfg.serif.family ];
            sansSerif = [ cfg.sansSerif.family ];
            emoji = [ cfg.emoji.family ];
          };
        };
      };
    };
}
