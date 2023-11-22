{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/auto-upgrade.nix
    ../common/optional/gaming.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix

    ../common/users/matt.nix
    ../common/users/alex.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  networking.hostName = "christopher";
  system.stateVersion = "unstable";
}
