{ config, ... }:

{
  xresources.properties = let inherit (config.colorScheme); in {
    "dwm*normbordercolor" = "#${colors.base02}";
    "dwm*normbgcolor" = "#${colors.base02}";
    "dwm*normfgcolor" = "#${colors.base05}";
    "dwm*selbordercolor" = "#${colors.base0B}";
    "dwm*selbgcolor" = "#${colors.base0B}";
    "dwm*selfgcolor" = "#${colors.base02}";
  };

}
