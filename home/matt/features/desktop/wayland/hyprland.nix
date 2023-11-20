{ inputs, config, pkgs, lib, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text =
    let
      inherit (config.colorScheme) colors;
      terminal = "${pkgs.kitty}/bin/kitty";
      browser = "${pkgs.firefox}/bin/firefox";
      mapMonitors = map (m: let
          resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          position = "${toString m.x}x${toString m.y}";
        in
          "monitor=${m.name},${if m.enable then "${resolution},${position},1" else "disable"}\n");
    in
    ''
      exec-once=waybar

      ${lib.concatStrings (mapMonitors config.monitors)}

      general {
        layout=master
        gaps_out=8
        gaps_in=4
        col.inactive_border=rgb(${colors.base03})
        col.active_border=rgb(${colors.base07})
      }
     
      decoration {
        rounding=4
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
