{ config, pkgs, ... }:

let
  inherit (config.colorScheme) palette;
  inherit (config.rice.fonts.monospace) family;
  toColor = color: "#${color}";
in
{
  programs.bemenu = {
    enable = true;
    package = pkgs.unstable.bemenu;
    settings = {
      width-factor = 0.3;
      list = 10;
      border = 2;
      border-radius = 8;
      no-overlap = true;
      center = true;
      ignorecase = true;
      fn = "${family} 11";
      bdr = toColor palette.base0A;
      # title
      tb = toColor palette.base00;
      tf = toColor palette.base0A;
      # filter
      fb = toColor palette.base00;
      ff = toColor palette.base05;
      # normal
      nb = toColor palette.base00;
      nf = toColor palette.base05;
      # highlighted
      hb = toColor palette.base00;
      hf = toColor palette.base0A;
      # highlighted
      ab = toColor palette.base00;
      af = toColor palette.base05;
    };
  };

}
