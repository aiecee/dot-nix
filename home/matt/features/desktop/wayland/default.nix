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

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
    nwg-look

    wlr-randr
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
  };

}
