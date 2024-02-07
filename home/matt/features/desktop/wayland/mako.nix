{ config, ... }:

let
  inherit (config.colorScheme) palette;
in
{
  services.mako = {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icon/Papirus-Dark";
    font = "${config.rice.fonts.monospace.family} 11";
    backgroundColor = "#${palette.base02}";
    borderColor = "#${palette.base0A}";
    borderRadius = 10;
    borderSize = 2;
    padding = "10,20";
    anchor = "top-right";
    width = 400;
    height = 150;
    defaultTimeout = 10000;
  };

}
