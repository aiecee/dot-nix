{ config, pkgs, ... }:
let
  inherit (config.colorScheme) palette;
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # swaylock
      ignore-empty-password = true;

      # effects
      screenshots = true;
    };
  };
}
