{ config, pkgs, ... }:

let
  inherit (config.colorScheme) palette;
  inherit (config.rice.fonts.monospace) family;
  bemenu-args = ''
    -W 0.3 -l 10 -B 2 -R 8 -n -c --fn "${family} 12" --bdr "#${palette.base03}" --tb "#${palette.base00}" --fb "#${palette.base00}" --nb "#${palette.base00}" --hb "#${palette.base00}" --ab  "#${palette.base00}" --tf "#${palette.base0A}" --ff "#${palette.base05}" --nf "#${palette.base05}" --hf "#${palette.base0A}" --af "#${palette.base05}"
  '';
in
{

  home.packages = with pkgs; [
    bemenu-pipewire
    bemenu-power
    bemenu-screenshot
    bemenu
  ];

  xdg.configFile."hyprland/scripts/pipewire.sh" = {
    executable = true;
    text = ''
      ${pkgs.bemenu-pipewire}/bin/bemenu-pipewire ${bemenu-args}
    '';
  };

  xdg.configFile."hyprland/scripts/power.sh" = {
    executable = true;
    text = ''
      ${pkgs.bemenu-power}/bin/bemenu-power ${bemenu-args}
    '';
  };

  xdg.configFile."hyprland/scripts/run.sh" = {
    executable = true;
    text = ''
      ${pkgs.bemenu}/bin/bemenu-run -p "Run" ${bemenu-args}
    '';
  };

  xdg.configFile."hyprland/scripts/screenshot.sh" = {
    executable = true;
    text = ''
      ${pkgs.bemenu-screenshot}/bin/bemenu-screenshot ${bemenu-args}
    '';
  };

}
