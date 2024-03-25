{ pkgs, config, ... }:

{
  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    password = config.sops.secrets.matts-password;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };

  sops.secrets.matts-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.matt = import ../../../home/matt/${config.networking.hostName}.nix;

  security.pam.services = { swaylock = { }; };
}
