{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./mako.nix
    ./waybar.nix
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
    bemenu-pipewire
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

}
