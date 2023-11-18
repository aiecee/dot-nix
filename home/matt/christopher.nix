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

  # TODO: monitors here

}
