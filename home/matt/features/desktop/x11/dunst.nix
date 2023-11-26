{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#8CAAEE";
        separator_color = "frame";
        follow = "keyboard";
        width = 350;
        height = 150;
        corner_radius = 5;
        gap_size = 5;
        frame_width = 2;
        font = "SpaceMono Nerd Font Mono 10";
      };
      urgency_low = {
        background = "#303446";
        foreground = "#C6D0F5";
      };
      urgency_normal = {
        background = "#303446";
        foreground = "#C6D0F5";
      };
      urgency_critical = {
        background = "#303446";
        foreground = "#C6D0F5";
        frame_color = "#EF9F76";
      };
    };
  };

}
