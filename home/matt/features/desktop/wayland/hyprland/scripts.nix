{ config, pkgs, ... }:

let
  inherit (config.colorScheme) colors;
  inherit (config.rice.fonts.monospace) family;
  bemenu-args = ''
    -W 0.3 -l 10 -B 2 -R 8 -n -c --fn "${family} 12" --bdr "#${colors.base03}" --tb "#${colors.base00}" --fb "#${colors.base00}" --nb "#${colors.base00}" --hb "#${colors.base00}" --ab  "#${colors.base00}" --tf "#${colors.base0A}" --ff "#${colors.base05}" --nf "#${colors.base05}" --hf "#${colors.base0A}" --af "#${colors.base05}"
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
