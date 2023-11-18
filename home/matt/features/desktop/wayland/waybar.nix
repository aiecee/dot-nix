{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        height = 40;
        margin = "6";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "wireplumber"
          "clock"
        ];

        clock = {
          interval = 1;
          format = "{:%d/%m/%Y %H:%M:%S}";
          timezone = "GB";
          locale = "en_GB";
        };
        wireplumber = {
          format = "{node_name}: {volume}%";
        };
      };
    };
  };

}
