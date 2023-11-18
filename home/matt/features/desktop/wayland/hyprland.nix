{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
      ];

      bind = let
        terminal = "${pkgs.kitty}/bin/kitty";
        browser = defaultApp "x-scheme-handler/https";
      in [
        "SUPER,Return,exec,${terminal}"
        "SUPER,b,exec,${browser}"
        "SUPER,q,killactive"
        "SUPERSHIFT,e,exit"
      ];
    };
  };
}
