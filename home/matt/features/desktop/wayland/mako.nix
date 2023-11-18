{ config, ... }:

{
  services.mako = {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icon/Papirus-Dark";
    font = "${config.customFonts.regular.family} 12";
    padding = "10,20";
    anchor = "top-right";
    width = 400;
    height = 150;
    defaultTimeout = 10000;
  };

}
