{ pkgs, lib, config, ... }:

let
  homeConfigs = config.home-manager.users;
  homeSharePaths = lib.mapAttrsToList (n: v: "${v.home.path}/share") homeConfigs;
  vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeSharePaths}" GTK_USE_PORTAL=0'';

  mattConfig = homeConfigs.matt;
  gtkTheme = mattConfig.gtk.theme;
  iconTheme = mattConfig.gtk.iconTheme;
  cursorTheme = mattConfig.gtk.cursorTheme;
  font = config.rice.fonts.serif;
  wallpaper = mattConfig.wallpaper;

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
      background = {
        path = wallpaper;
        fit = "Cover";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = sway-kiosk (lib.getExe config.programs.regreet.package);
  };
}
