{ inputs, outputs, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    ./features/games
  ];

  colorScheme = inputs.nix-colors.colorschemes.catppuccin-frappe;

  # TODO: monitors here

}
