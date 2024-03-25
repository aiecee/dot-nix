{ pkgs, config, ... }:

{
  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    hashedPasswordFile = config.sops.secrets.matts-password.path;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };

  sops.age.keyFile = /home/matt/.config/sops/age/keys.txt;

  sops.secrets.matts-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.matt = import ../../../home/matt/${config.networking.hostName}.nix;

  security.pam.services = { swaylock = { }; };
}
