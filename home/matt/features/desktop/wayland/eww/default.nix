{ pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.unstable.eww;
    configDir = ./config;
  };
}
