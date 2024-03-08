{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/matt.nix
    ../common/users/alex.nix

    ../common/optional/auto-upgrade.nix
    #../common/optional/dwm
    ../common/optional/flatpak.nix
    ../common/optional/gaming.nix
    ../common/optional/greetd.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/xwayland.nix
  ];

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

  networking.hostName = "christopher";
  system.stateVersion = "23.11";
}
