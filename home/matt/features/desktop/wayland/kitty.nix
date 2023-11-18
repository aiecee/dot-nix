{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = config.customFonts.monospace.family;
      size = 12;
    };
  };
}
