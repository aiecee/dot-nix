{ pkgs
, inputs
, ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/matt.nix
    ../common/users/alex.nix

    ../common/optional/auto-upgrade.nix
    #../common/optional/dwm
    ../common/optional/flatpak.nix
    ../common/optional/gaming.nix
    # ../common/optional/greetd.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/qmk.nix
    ../common/optional/xwayland.nix
    # ../common/optional/windowManager/hypr.nix
  ];

  users.mutableUsers = false;

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
      primary = false;
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      defaultWorkspace = 1;
    };
  };

  # programs.niri.enable = true;
  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  networking.hostName = "christopher";
  system.stateVersion = "23.11";
}
