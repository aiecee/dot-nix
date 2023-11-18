{ inputs, config, pkgs, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text =
    let
      terminal = "${pkgs.kitty}/bin/kitty";
      browser = "${pkgs.firefox}/bin/firefox";
    in  
    ''
    exec-once ${pkgs.waybar}/bin/waybar
    bind=SUPER,Return,exec,${terminal}"
    bind=SUPER,b,exec,${browser}"
    bind=SUPER,q,killactive"
    bind=SUPERSHIFT,e,exit"
    '';
}
