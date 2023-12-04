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
    xwallpaper --clear --daemon --output all --center "$HOME/.config/wallpapers/wallpaper2.png"
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
    dmenu-kill-process
    slstatus
    xclip
    maim
    xdotool
    xwallpaper
  ];
}
