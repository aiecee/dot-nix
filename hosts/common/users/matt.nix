{ pkgs, config, ... }:

{
  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    initialPassword = "password";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };

  home-manager.users.matt = import ../../../home/matt/${config.networking.hostName}.nix;
}
