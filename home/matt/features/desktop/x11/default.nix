{ pkgs, ... }:

{

  imports = [
    ./sxhkd.nix
    ./dunst.nix
  ];

  xsession = {
    enable = true;
    initExtra = ''
    xrandr --output DP-1 --right-of HDMI-1
    '';
  };

  home.packages = with pkgs; [
    dmenu
    dmenu-pipewire
    dmenu-power
  ];
}
