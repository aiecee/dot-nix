{ pkgs, ... }:

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
}
