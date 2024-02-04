{ inputs, pkgs, config, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    ./features/neovim
  ];

  colorScheme = inputs.nix-colors.colorschemes.rose-pine-moon;

  rice.fonts = 
  let
      fontPackage = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
  in 
  {
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
