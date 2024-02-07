{ config, ... }:

let
  inherit (config.colorScheme) palette;
  toColor = color: "#${color}";
in
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      themes =
        {
          nix-theme = {
            fg = toColor palette.base05;
            bg = toColor palette.base00;
            black = toColor palette.base03;
            red = toColor palette.base08;
            green = toColor palette.base0B;
            yellow = toColor palette.base09;
            blue = toColor palette.base0C;
            magenta = toColor palette.base0D;
            cyan = toColor palette.base0A;
            white = toColor palette.base05;
            orange = toColor palette.base0A;
          };
        };
      theme = "nix-theme";
    };
  };
}
