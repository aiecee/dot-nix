{ config, ... }:

{
  xresources.properties =
    let
      inherit (config.colorScheme) colors;
      font = config.customFonts.monospace.family;
    in
    {
      "dwm.normbordercolor" = "#${colors.base03}";
      "dwm.normbgcolor" = "#${colors.base00}";
      "dwm.normfgcolor" = "#${colors.base05}";
      "dwm.selbordercolor" = "#${colors.base0A}";
      "dwm.selbgcolor" = "#${colors.base0A}";
      "dwm.selfgcolor" = "#${colors.base00}";
    };

}
