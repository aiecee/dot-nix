{ lib, config, ... }:
let
  cfg = config.rice.cursor;
in 
{
  imports = [
    ../shared/cursor.nix
  ];

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      cursorTheme = {
        package = cfg.package;
        name = cfg.name;
        size = cfg.size;
      };
    };
    home.pointerCursor = {
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = cfg.name;
      };
      package = cfg.package;
      name = cfg.name;
      size = cfg.size;
    };
  };
}
