{ inputs, pkgs, ... }:
let
  fontPackage = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in
{
  rice = {
    fonts = {
      enable = true;
      monospace = {
        family = "Hack Nerd Font";
        package = fontPackage;
      };
      serif = {
        family = "Hack Nerd Font Propo";
        package = fontPackage;
      };
      sansSerif = {
        family = "Hack Nerd Font Propo";
        package = fontPackage;
      };
      emoji = {
        family = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
    };
    cursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    icons = {
      enable = true;
      package = pkgs.sweet-folders;
      name = "Sweet-Mars";
    };
    gtk = {
      enable = true;
      package = gtkThemeFromScheme {
        scheme = inputs.nix-colors.colorschemes.everforest;
      };
      name = "everforest";
    };
  };
}

