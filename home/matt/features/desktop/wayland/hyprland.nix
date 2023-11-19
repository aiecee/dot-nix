{ inputs, config, pkgs, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text =
    let
      terminal = "${pkgs.kitty}/bin/kitty";
      browser = "${pkgs.firefox}/bin/firefox";
    in  
    ''
    exec-once=${pkgs.waybar}/bin/waybar
    general {
      layout=master
    }
   
    input {
      kb_layout=gb
    }

    bind=SUPER,Return,exec,${terminal}
    bind=SUPER,b,exec,${browser}
    bind=SUPER,q,killactive
    bind=SUPERSHIFT,q,exit
    '';

  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #  systemd.enable = true;
  #  enableNvidiaPatches = false;
  #  settings = {
  #    exec-once = [
  #      "${pkgs.waybar}/bin/waybar"
  #    ];
  #    general = {
  #      layout = "master";
  #    };
  #    input = {
  #      kb_layout = "gb";
  #    };
  #    binds = 
  #      let
  #        terminal = "${pkgs.kitty}/bin/kitty";
  #        browser = "${pkgs.firefox}/bin/firefox";
  #      in  
  #        [
  #          "SUPER,Return,exec,${terminal}"
  #          "SUPER,b,exec,${browser}"
  #          "SUPER,q,killactive"
  #          "SUPERSHIFT,q,exit"
  #        ];
  #  };

  #};
}
