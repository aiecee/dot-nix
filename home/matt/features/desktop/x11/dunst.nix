{ config, ... }:
let
  inherit (config.colorScheme) colors;
  inherit (config.rice.fonts.monospace) family;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#${colors.base0D}";
        separator_color = "frame";
        follow = "keyboard";
        width = 350;
        height = 150;
        gap_size = 5;
        frame_width = 1;
        font = "${family} 10";
      };
      urgency_low = {
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
      };
      urgency_normal = {
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
      };
      urgency_critical = {
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
        frame_color = "#${colors.base08}";
      };
    };
  };

}
