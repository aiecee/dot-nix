{ inputs, config, pkgs, lib, ... }:

{

  programs = {
    zsh = {
      loginExtra = /* bash */ ''
        if [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland &> /dev/null
        fi
      '';
      profileExtra = /* bash */ ''
        if [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland &> /dev/null
        fi
      '';
    };
  };

  xdg.configFile."hypr/hyprland.conf".text =
    let
      # inherit colours
      inherit (config.colorScheme) colors;

      # basic programs
      terminal = "${pkgs.kitty}/bin/kitty";
      browser = "${pkgs.firefox}/bin/firefox";
      bemenu-pipewire = ''
${pkgs.bemenu-pipewire}/bin/bemenu-pipewire -W 0.3 --fn "FiraCode Nerd Font Mono" -l 10 -B 1 -R 8 -n -M 50 --fb "#303446" --ff "#c6d0f5" --nb "#303446" --nf "#c6d0f5" --tb "#303446" --hb "#303446" --tf "#e78284" --hf "#e5c890" --nf "#c6d0f5" --af "#c6d0f5" --ab "#303446" --bdr "#51576d"
'';
      bemenu-pipewire2 = ''
${pkgs.bemenu-pipewire}/bin/bemenu-pipewire'';

      # config vars
      workspaces = (map toString (lib.range 1 9));
      directions = rec {
        left = "l";
        right = "r";
        up = "u";
        down = "d";
        h = left;
        l = right;
        k = up;
        j = down;
      };

      # config generation
      monitorConfig =
        (lib.concatStrings
          (lib.mapAttrsToList
            (name: m:
              let
                resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
                position = "${toString m.x}x${toString m.y}";
              in
              ''
                monitor=${name},${resolution},${position},1
              ''
            )
            config.monitors)
        );
      workspaceConfig = (lib.concatStringsSep "\n" (lib.mapAttrsToList
        (name: m:
          let
            workspaces = (lib.concatStringsSep "\n" (map
              (w:
                "workspace=${toString w},monitor:${name},${toString (if m.defaultWorkspace == w then "default:true," else "")}persistent:true"
              )
              m.workspaces));
          in
          ''
            ${workspaces}
          ''
        )
        config.monitors));
      workspaceBinds = (lib.concatStringsSep "\n" (map (n: "bind=SUPER,${n},workspace,name:${n}") workspaces));
      moveToWorkspaceBinds = (lib.concatStringsSep "\n" (map (n: "bind=SUPERSHIFT,${n},movetoworkspace,name:${n}") workspaces));
      moveFocusBinds =
        (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPER,${key},movefocus,${direction}") directions));
      swapWindowBinds = (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPERSHIFT,${key},swapwindow,${direction}") directions));
      focusMonitorBinds = (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPERCONTROL,${key},focusmonitor,${direction}") directions));
    in
    ''
      exec-once=${pkgs.unstable.waybar}/bin/waybar 2>&1 > ~/waybar.log &

      ${monitorConfig}

      ${workspaceConfig}

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

      ${workspaceBinds}

      ${moveToWorkspaceBinds}

      ${moveFocusBinds}

      ${swapWindowBinds}

      ${focusMonitorBinds}

      bind=SUPER,Return,exec,${terminal}
      bind=SUPER,b,exec,${browser}
      bind=SUPER,a,exec,${bemenu-pipewire2}
      bind=SUPER,q,killactive
      bind=SUPERSHIFT,q,exit
    '';

}
