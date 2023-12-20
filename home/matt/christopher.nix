{ inputs, pkgs, config, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    ./features/desktop/wayland
    #./features/desktop/x11
    ./features/games
  ];

  colorScheme = inputs.nix-colors.colorschemes.rose-pine-moon;

  customFonts =
    let
      fontPackage = pkgs.nerdfonts.override { fonts = [ "Noto" ]; };
    in
    {
      enable = true;
      monospace = {
        family = "NotoMono Nerd Font";
        package = fontPackage;
      };
      regular = {
        family = "NotoSans Nerd Font";
        package = fontPackage;
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
