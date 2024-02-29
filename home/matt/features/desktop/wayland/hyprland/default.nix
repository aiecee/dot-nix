{ inputs, config, pkgs, lib, ... }:

let
  # inherit colours
  inherit (config.colorScheme) palette;

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

  mapMonitors = lib.mapAttrsToList (name: m: "${name}, ${toString m.width}x${toString m.height}@${toString m.refreshRate}, ${toString m.x}x${toString m.y}, 1");
  mapDefaultWorkspaces = lib.mapAttrsToList (name: m: "${toString m.defaultWorkspace}, monitor:${name}, default:true, persistent:true");
  mapWorkspaces = lib.mapAttrsToList (name: m: map (w: "${toString w}, monitor:${name}") m.workspaces);

  workspaceBinds = map (n: "SUPER,${n},workspace,name:${n}");
  moveToWorkspaceBinds = map (n: "SUPERSHIFT,${n},movetoworkspace,name:${n}");
  moveFocusBinds = lib.mapAttrsToList (key: direction: "SUPER,${key},movefocus,${direction}");
  swapWindowBinds = lib.mapAttrsToList (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}");
  focusMonitorBinds = lib.mapAttrsToList (key: direction: "SUPERCONTROL,${key},focusmonitor,${direction}");

  terminal = "${pkgs.kitty}/bin/kitty";
  browser = "${pkgs.firefox}/bin/firefox";
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  bemenu-pipewire = "$HOME/${config.xdg.configFile."hyprland/scripts/pipewire.sh".target}";
  bemenu-power = "$HOME/${config.xdg.configFile."hyprland/scripts/power.sh".target}";
  bemenu-run = "$HOME/${config.xdg.configFile."hyprland/scripts/run.sh".target}";
  bemenu-screenshot = "$HOME/${config.xdg.configFile."hyprland/scripts/screenshot.sh".target}";
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
    xwayland.enable = true;
    systemd.enable = true;
    package = pkgs.hyprland;
    settings = {
      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
      ];
      exec-once = [
        #"${pkgs.udiskie}/bin/udiskie &"
      ];
      general = {
        layout = "master";
        gaps_out = 8;
        gaps_in = 4;
        "col.inactive_border" = "rgb(${palette.base03})";
        "col.active_border" = "rgb(${palette.base0A})";
        border_size = 2;
      };
      decoration = {
        rounding = 6;
        drop_shadow = false;
      };
      input = {
        kb_layout = "gb";
        mouse_refocus = false;
      };
      misc = {
        enable_swallow = true;
        new_window_takes_over_fullscreen = 2;
      };
      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];

        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
        ];
      };
      monitor = (mapMonitors config.monitors);
      workspace = (mapDefaultWorkspaces config.monitors) ++ lib.concatLists (mapWorkspaces config.monitors);
      windowrulev2 = [
        "tile, class:^(steam_app_)([0-9]*)$"
        "workspace 1, class:^(firefox)$"
        "workspace 3, class:^(discord)$"
        "workspace 4, class:^(steam)$"
      ];
      bind =
        (workspaceBinds workspaces) ++
        (moveToWorkspaceBinds workspaces) ++
        (moveFocusBinds directions) ++
        (swapWindowBinds directions) ++
        (focusMonitorBinds directions) ++
        [
          "SUPER,Return,exec,${terminal}"
          "SUPER,b,exec,${browser}"
          "SUPERSHIFT,l,exec,${swaylock}"
          "SUPER,a,exec,${bemenu-pipewire}"
          "SUPER,p,exec,${bemenu-power}"
          "SUPER,s,exec,${bemenu-screenshot}"
          "SUPER,Space,exec,${bemenu-run}"
          "SUPER,f,fullscreen,0"
          "SUPERSHIFT,f,fakefullscreen"
          "SUPER,q,killactive"
          "SUPERSHIFT,q,exit"
          ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
          ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
          ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ];
    };
  };

}
