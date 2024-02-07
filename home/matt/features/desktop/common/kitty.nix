{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Hack NF";
      package = config.rice.fonts.monospace.package;
      size = 10;
    };
    settings =
      let
        inherit (config.colorScheme) palette;
        toColor = color: "#${color}";
      in
      {
        # Basic Colors
        foreground = toColor palette.base05;
        background = toColor palette.base00;
        selection_foreground = toColor palette.base05;
        selection_background = toColor palette.base0F;

        # Cursor palette
        cursor = toColor palette.base03;
        cursor_text_color = toColor palette.base05;

        # URL underline
        url_color = toColor palette.base0D;

        # Window borders
        active_border_color = toColor palette.base0B;
        inactive_border_color = toColor palette.base0F;
        bell_border_color = toColor palette.base08;

        # OS Window titlebar palette
        wayland_titlebar_color = "system";
        macos_titlebar_color = "system";

        # Tab bar palette
        active_tab_foreground = toColor palette.base05;
        active_tab_background = toColor palette.base02;
        inactive_tab_foreground = toColor palette.base03;
        inactive_tab_background = toColor palette.base00;

        # The 16 terminal palette

        # black
        color0 = toColor palette.base02;
        color8 = toColor palette.base03;

        # red
        color1 = toColor palette.base08;
        color9 = toColor palette.base08;

        # green
        color2 = toColor palette.base0B;
        color10 = toColor palette.base0B;

        # yellow
        color3 = toColor palette.base09;
        color11 = toColor palette.base09;

        # blue
        color4 = toColor palette.base0C;
        color12 = toColor palette.base0C;

        # magenta
        color5 = toColor palette.base0D;
        color13 = toColor palette.base0D;

        # cyan
        color6 = toColor palette.base0A;
        color14 = toColor palette.base0A;

        # white
        color7 = toColor palette.base05;
        color15 = toColor palette.base05;
      };
  };
}
