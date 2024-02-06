{ pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./gammastep.nix
    ./kitty.nix
    ./usb.nix
  ];

  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    gvfs # missing dependency for thunar (volman?)
    via
    vlc
  ];
}
