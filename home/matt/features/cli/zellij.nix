{ config, ... }:

let
  inherit (config.colorScheme) name colors;
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
            fg = toColor colors.base05;
            bg = toColor colors.base00;
            black = toColor colors.base03;
            red = toColor colors.base08;
            green = toColor colors.base0B;
            yellow = toColor colors.base09;
            blue = toColor colors.base0C;
            magenta = toColor colors.base0D;
            cyan = toColor colors.base0A;
            white = toColor colors.base05;
            orange = toColor colors.base0A;
          };
        };
      theme = "nix-theme";
    };
  };
}
