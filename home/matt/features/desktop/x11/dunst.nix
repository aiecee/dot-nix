{ config, ... }:
let
  inherit (config.colorScheme) palette;
  inherit (config.rice.fonts.monospace) family;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#${palette.base0D}";
        separator_color = "frame";
        follow = "keyboard";
        width = 350;
        height = 150;
        gap_size = 5;
        frame_width = 1;
        font = "${family} 10";
      };
      urgency_low = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
      };
      urgency_normal = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
      };
      urgency_critical = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        frame_color = "#${palette.base08}";
      };
    };
  };

}
