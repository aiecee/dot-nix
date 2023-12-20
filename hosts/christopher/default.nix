{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/users/matt.nix
    ../common/users/alex.nix

    ../common/optional/auto-upgrade.nix
    #../common/optional/dwm
    ../common/optional/gaming.nix
    ../common/optional/greetd.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
  ];

  networking.hostName = "christopher";
  system.stateVersion = "23.11";
}
