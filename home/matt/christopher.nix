{ inputs, pkgs, ... }:

{
  imports = [
    ./global

    ./features/cli
    ./features/desktop/common
    #./features/desktop/wayland
    ./features/desktop/x11
    ./features/games
  ];

  colorScheme = inputs.nix-colors.colorschemes.catppuccin-frappe;

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

  monitors = {
    DP-1 = {
      primary = true;
      width = 1920;
      height = 1080;
      x = 1920;
      y = 0;
      workspaces = [ 2 3 4 5 6 7 8 9 ];
      defaultWorkspace = 2;
    };
    HDMI-A-1 = {
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      workspaces = [ 1 ];
      defaultWorkspace = 1;
    };
  };

}
