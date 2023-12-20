{ inputs, config, pkgs, lib, ... }:

let
  # inherit colours
  inherit (config.colorScheme) colors;
in
{

  imports = [
    inputs.hyprland.homeManagerModules.default
    ./scripts.nix
  ];

  programs.zsh = {
    loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
    profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';

  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill" 
      ];
      general = {
        layout = "master";
        gaps_out = 8;
        gaps_in = 4;
        "col.inactive_border" = "rgb(${colors.base03})";
        "col.active_border" = "rgb(${colors.base09})";
      };
      decoration = {
        rounding = 4;
        drop_shadow = false;
      };
      input = {
        kb_layout = "gb";
      };
      misc = {
        enable_swallow = true;
        new_window_takes_over_fullscreen = 2;
      };
      monitor = (lib.mapAttrsToList (name: m: "${name}, ${toString m.width}x${toString m.height}@${toString m.refreshRate}, ${toString m.x}x${toString m.y}, 1") config.monitors);
      workspace = (lib.mapAttrsToList (name: m: "${toString m.defaultWorkspace}, monitor:${name}, default:true, persistent:true") config.monitors);
      windowrulev2 = [
      ];
    };
    extraConfig =
      let
        # basic programs
        terminal = "${pkgs.kitty}/bin/kitty";
        browser = "${pkgs.firefox}/bin/firefox";
        bemenu-pipewire = "$HOME/${config.xdg.configFile."hyprland/scripts/pipewire.sh".target}";
        bemenu-power = "$HOME/${config.xdg.configFile."hyprland/scripts/power.sh".target}";
        bemenu-run = "$HOME/${config.xdg.configFile."hyprland/scripts/run.sh".target}";

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

        workspaceBinds = (lib.concatStringsSep "\n" (map (n: "bind=SUPER,${n},workspace,name:${n}") workspaces));
        moveToWorkspaceBinds = (lib.concatStringsSep "\n" (map (n: "bind=SUPERSHIFT,${n},movetoworkspace,name:${n}") workspaces));
        moveFocusBinds =
          (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPER,${key},movefocus,${direction}") directions));
        swapWindowBinds = (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPERSHIFT,${key},swapwindow,${direction}") directions));
        focusMonitorBinds = (lib.concatStringsSep "\n" (lib.mapAttrsToList (key: direction: "bind=SUPERCONTROL,${key},focusmonitor,${direction}") directions));
      in
      ''

      ${workspaceBinds}

      ${moveToWorkspaceBinds}

      ${moveFocusBinds}

      ${swapWindowBinds}

      ${focusMonitorBinds}

      bind=SUPER,Return,exec,${terminal}
      bind=SUPER,b,exec,${browser}
      bind=SUPER,a,exec,${bemenu-pipewire}
      bind=SUPER,p,exec,${bemenu-power}
      bind=SUPER,r,exec,${bemenu-run}
      bind=SUPER,q,killactive
      bind=SUPERSHIFT,q,exit
    '';
  };

}
