{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/auto-upgrade.nix
    ../common/optional/fonts.nix
    ../common/optional/gaming.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix

    ../common/users/matt.nix
    ../common/users/alex.nix
  ];
  networking.hostname = "christopher";
  system.stateVersion = "unstable";
}
