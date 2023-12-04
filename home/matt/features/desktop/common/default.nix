{ pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./gammastep.nix
    ./gtk.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    gvfs # missing dependency for thunar (volman?)
  ];
}
