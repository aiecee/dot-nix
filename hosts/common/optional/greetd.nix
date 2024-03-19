{ pkgs, lib, config, ... }:

let
  inherit (config) monitors;

  homeConfigs = config.home-manager.users;
  homeSharePaths = lib.mapAttrsToList (n: v: "${v.home.path}/share") homeConfigs;
  flatpakPaths = if config.services.flatpak.enable then ":/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share" else "";
  vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeSharePaths}${flatpakPaths}" GTK_USE_PORTAL=0'';

  gtkTheme = config.rice.gtk;
  iconTheme = config.rice.icons;
  cursorTheme = config.rice.cursor;
  font = config.rice.fonts.serif;

  #kanshi = lib.getExe pkgs.kanshi;
  #mkKanshiOutput = name: monitor: ''
  #  output ${name} enable mode ${toString monitor.width}x${toString monitor.height} position ${toString monitor.x},${toString monitor.y}
  #'';
  #mkKanshiProfile = mntrs: vrs: command: ''
  #  profile {
  #    ${lib.concatLines (lib.mapAttrsToList mkKanshiOutput mntrs)}
  #    exec '${vrs} ${command}'
  #  }
  #'';
  #cage-kiosk = mntrs: vrs: command: "${lib.getExe pkgs.cage} -s -m last -- ${kanshi} -c ${pkgs.writeText "kanshi-kiosk.config" (mkKanshiProfile mntrs vrs command)}";

  sway-kiosk = command: "${lib.getExe pkgs.sway} --config ${pkgs.writeText "kiosk.config" ''
    output * bg #000000 solid_color
    exec '${vars} ${command} -l debug; ${pkgs.sway}/bin/swaymsg exit'
  ''}";
in
{
  users.extraUsers.greeter = {
    packages = [
      gtkTheme.package
      iconTheme.package
      cursorTheme.package
      font.package
    ];
    home = "/tmp/greeter-home";
    createHome = true;
  };

  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        font_name = "${font.family} 12";
        application_prefer_dark_theme = true;
        icon_theme_name = iconTheme.name;
        theme_name = gtkTheme.name;
        cursor_theme_name = cursorTheme.name;
      };
      #background = {
      #  path = wallpaper;
      #  fit = "Cover";
      #};
    };
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = sway-kiosk (lib.getExe config.programs.regreet.package);
    #settings.default_session.command = cage-kiosk monitors vars (lib.getExe config.programs.regreet.package);
  };
}
