{ pkgs, ... }:

{

  environment.etc."greetd/hyprland.conf".text = "exec-once regreet; hyprctl dispatch exit";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland --config /etc/greetd/hyprland.conf";
        user = "matt";
      };

    };
  };

  programs.regreet.enable = true;


}
