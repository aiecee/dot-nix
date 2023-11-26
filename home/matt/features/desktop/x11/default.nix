{ pkgs, ... }:

{

  imports = [
    ./sxhkd.nix
    ./dunst.nix
  ];

  home.packages = with pkgs.unstable; [
    dmenu
    dmenu-pipewire
    dmenu-power
  ];
}
