{ config, ... }:

{
  xresources.properties = 
  let
    inherit (config.colorScheme) colors;
    font = config.customFonts.monospace.family;
  in {
    "dwm.normbordercolor" = "#${colors.base0F}";
    "dwm.normbgcolor" = "#${colors.base0F}";
    "dwm.normfgcolor" = "#${colors.base05}";
    "dwm.selbordercolor" = "#${colors.base0D}";
    "dwm.selbgcolor" = "#${colors.base0D}";
    "dwm.selfgcolor" = "#${colors.base0F}";
  };

}
