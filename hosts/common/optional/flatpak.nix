{ pkgs, ... }:

{
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
     config.common.default = "*";
  };
}
