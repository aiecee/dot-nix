{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./mako.nix
    ./waybar.nix
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
    bemenu-pipewire
    bemenu
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

}
