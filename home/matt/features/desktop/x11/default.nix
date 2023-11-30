{ pkgs, ... }:

{

  imports = [
    ./dunst.nix
    ./picom.nix
    ./sxhkd.nix
    ./xresources.nix
  ];

  xsession = {
    enable = true;
    initExtra = ''
    xrandr --output DP-1 --right-of HDMI-1
    ${pkgs.slstatus}/bin/slstatus &
    '';
  };

  home.file.".config/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  home.packages = with pkgs; [
    dmenu
    dmenu-pipewire
    dmenu-power
    slstatus
    xclip
    maim
    xdotool
    xwallpaper
  ];
}
