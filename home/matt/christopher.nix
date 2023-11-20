{ inputs, pkgs, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    ./features/games
  ];

  colorScheme = inputs.nix-colors.colorschemes.catppuccin-frappe;

  customFonts = {
    enable = true;
    monospace = {
      family = "FiraCode Nerd Font";
      package = pkgs.nerdfonts;
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };

  monitors = [
    {
      name = "DP-1";
      enable = true;
      primary = true;
      width = 1920;
      height = 1080;
      x = 1920;
      y = 0;
      workspaces = [ "1" "3" "4" "5" "6" "7" "8" "9" ];
    }
    {
      name = "HDMI-A-1";
      enable = true;
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      workspaces = [ "2" ];
    }
  ];

}
