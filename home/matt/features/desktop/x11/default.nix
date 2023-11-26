{ pkgs, ... }:

{

  imports = [
    ./sxhkd.nix
    ./dunst.nix
  ];

  home.packages = with pkgs; [
    dmenu
    dmenu-pipewire
    dmenu-power
  ];
}
