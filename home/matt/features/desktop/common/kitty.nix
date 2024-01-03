{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      #name = config.customFonts.monospace.family;
      name = "Hack NF";
      package = config.customFonts.monospace.package;
      size = 10;
    };
    settings =
      let
        inherit (config.colorScheme) colors;
        toColor = color: "#${color}";
      in
      {
        # Basic Colors
        foreground = toColor colors.base05;
        background = toColor colors.base00;
        selection_foreground = toColor colors.base05;
        selection_background = toColor colors.base0F;

        # Cursor colors
        cursor = toColor colors.base03;
        cursor_text_color = toColor colors.base05;

        # URL underline
        url_color = toColor colors.base0D;

        # Window borders
        active_border_color = toColor colors.base0B;
        inactive_border_color = toColor colors.base0F;
        bell_border_color = toColor colors.base08;

        # OS Window titlebar colors
        wayland_titlebar_color = "system";
        macos_titlebar_color = "system";

        # Tab bar colors
        active_tab_foreground = toColor colors.base05;
        active_tab_background = toColor colors.base02;
        inactive_tab_foreground = toColor colors.base03;
        inactive_tab_background = toColor colors.base00;

        # The 16 terminal colors

        # black
        color0 = toColor colors.base02;
        color8 = toColor colors.base03;

        # red
        color1 = toColor colors.base08;
        color9 = toColor colors.base08;

        # green
        color2 = toColor colors.base0B;
        color10 = toColor colors.base0B;

        # yellow
        color3 = toColor colors.base09;
        color11 = toColor colors.base09;

        # blue
        color4 = toColor colors.base0C;
        color12 = toColor colors.base0C;

        # magenta
        color5 = toColor colors.base0D;
        color13 = toColor colors.base0D;

        # cyan
        color6 = toColor colors.base0A;
        color14 = toColor colors.base0A;

        # white
        color7 = toColor colors.base05;
        color15 = toColor colors.base05;
      };
  };
}
