{ config, ... }:

{
  xresources.properties = 
  let
    inherit (config.colorScheme) colors;
    font = config.customFonts.monospace.family;
  in {
    "dwm.font" = "${font}:size=12";
    "dwm.normbordercolor" = "#${colors.base02}";
    "dwm.normbgcolor" = "#${colors.base02}";
    "dwm.normfgcolor" = "#${colors.base05}";
    "dwm.selbordercolor" = "#${colors.base0F}";
    "dwm.selbgcolor" = "#${colors.base0F}";
    "dwm.selfgcolor" = "#${colors.base03}";
    "dwm.gappx" = 20;
  };

}
