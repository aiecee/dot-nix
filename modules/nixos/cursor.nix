{ lib, config, ... }:
let
  cfg = config.rice.cursor;
in
{
  imports = [
    ../shared/cursor.nix
  ];

  config = lib.mkIf cfg.enable {
    environment = {
      variables = {
        XCURSOR_THEME = cfg.name;
        XCURSOR_SIZE = toString cfg.size;
      };
      systemPackages = [ cfg.package ];
    };
  };
}
