{ inputs, pkgs, config, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    ./features/neovim

    ../../shared/tokyo-night-terminal-storm.nix
  ];

  #colorScheme = inputs.nix-colors.colorschemes.rose-pine-moon;
  #colorScheme = inputs.nix-colors.colorschemes.stella;
  colorScheme = inputs.nix-colors.colorschemes.tokyo-night-terminal-storm;

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
