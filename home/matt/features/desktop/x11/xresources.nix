{ config, ... }:

{
  xresources.properties =
    let
      inherit (config.colorScheme) palette;
      font = config.rice.fonts.monospace.family;
    in
    {
      "dwm.normbordercolor" = "#${palette.base03}";
      "dwm.normbgcolor" = "#${palette.base00}";
      "dwm.normfgcolor" = "#${palette.base05}";
      "dwm.selbordercolor" = "#${palette.base0A}";
      "dwm.selbgcolor" = "#${palette.base0A}";
      "dwm.selfgcolor" = "#${palette.base00}";
    };

}
