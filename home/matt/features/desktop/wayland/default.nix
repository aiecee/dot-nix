{ pkgs, ... }:

{
  imports = [
    ./hyprland
    ./mako.nix
    ./waybar.nix
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

}
