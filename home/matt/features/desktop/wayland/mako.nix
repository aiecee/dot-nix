{ config, ... }:

let
  inherit (config.colorScheme) colors;
in
{
  services.mako = {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icon/Papirus-Dark";
    font = "${config.customFonts.monospace.family} 11";
    backgroundColor = "#${colors.base02}";
    borderColor = "#${colors.base09}";
    borderRadius = 10;
    padding = "10,20";
    anchor = "top-right";
    width = 400;
    height = 150;
    defaultTimeout = 10000;
  };

}
