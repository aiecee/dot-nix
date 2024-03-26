{ inputs, pkgs, config, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    ./features/neovim

    ../../shared/katy.nix
  ];

  #colorScheme = inputs.nix-colors.colorschemes.rose-pine-moon;
  #colorScheme = inputs.nix-colors.colorschemes.tokyo-night-terminal-storm;
  #colorScheme = inputs.nix-colors.colorschemes.ayu-mirage;
  colorScheme = inputs.nix-colors.colorschemes.katy;
  #colorScheme = inputs.nix-colors.colorschemes.lime;
  #colorScheme = inputs.nix-colors.colorschemes.stella;

  wallpaper =
    let
      inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) nixWallpaperFromScheme;
    in
    (nixWallpaperFromScheme {
      scheme = config.colorScheme;
      width = 1920;
      height = 1080;
      logoScale = 4;
    });

  monitors = {
    DP-1 = {
      primary = true;
      width = 1920;
      height = 1080;
      x = 1920;
      y = 0;
      workspaces = [ 3 4 5 6 7 8 9 ];
      defaultWorkspace = 2;
    };
    HDMI-A-1 = {
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      defaultWorkspace = 1;
    };
  };

}
