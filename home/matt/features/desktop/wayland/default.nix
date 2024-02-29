{ pkgs, ... }:

{
  imports = [
    ./hyprland
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
  ];

  xdg.mimeApps.enable = true;

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
    nwg-look
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

}
