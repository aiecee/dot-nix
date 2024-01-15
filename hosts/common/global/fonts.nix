{ config, ... }:
let
  inherit (config.customFonts) regular monospace;
in 
{
  fonts.packages = [ regular.package monospace.package ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ regular.family ];
      sansSerif = [ regular.family ];
      monospace = [ monospace.family ];
    };
  };

}
