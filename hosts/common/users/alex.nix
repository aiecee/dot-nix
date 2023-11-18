{ pkgs, ... }:

{
  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "video" "audio" ];
  };
}
