{ pkgs, config, ... }:
let
  homeConfigs = config.home-manager.users;
  mattConfig = homeConfigs.matt;
in
{
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "Noto" "Hack" ]; }) ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ mattConfig.customFonts.regular.family ];
      sansSerif = [ mattConfig.customFonts.regular.family ];
      monospace = [ mattConfig.customFonts.monospace.family ];
    };
  };

}
