{ pkgs, ... }:

{
  imports = [
    ./eww
    ./hyprland
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
    nwg-look
    gtk3

    wlr-randr
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    GDK_BACKEND = "wayland,x11";
  };

}
