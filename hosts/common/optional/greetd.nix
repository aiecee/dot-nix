{pkgs, lib, config, ... }:

let
  homeConfigs = config.home-manager.users;
  homeSharePaths = (lib.mapAttrsToList (n: v: "${v.home.path}/share") homeConfigs);
  vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeSharePaths}"'';
  mattConfig = homeConfigs.matt;
  gtkTheme = mattConfig.gtk.theme;
  iconTheme = mattConfig.gtk.iconTheme;
  cursorTheme = mattConfig.gtk.cursorTheme;

  sway-kiosk = command: "${lib.getExe pkgs.sway} --config ${pkgs.writeText "kiosk.config" ''
    output * bg #000000 solid_color
    xwayland disable
    exec 'GTK_USE_PORTAL=0 ${vars} ${command}; ${pkgs.sway}/bin/swaymsg exit'
  ''}";
in
{
  users.extraUsers.greeter = {
    packages = [
      gtkTheme.package
      iconTheme.package
      cursorTheme.package
    ];
    home = "/tmp/greeter-home";
    createHome = true;
  };

  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        icon_theme_name = iconTheme.name;
        theme_name = gtkTheme.name;
        cursor_theme_name = cursorTheme.name;
      };
    };
  };

  service.greetd = {
    enable = true;
    settings.default_session.command = sway-kiosk (lib.getExe config.programs.regreet.package);
  };
}
