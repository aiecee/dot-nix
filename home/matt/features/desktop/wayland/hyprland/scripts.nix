{ config, pkgs, ... }:

let
  inherit (config.colorScheme) colors;
  inherit (config.customFonts.monospace) family;
  bemenu-args = ''
    -W 0.3 -l 10 -B 1 -R 8 -n -M 50 --fn "${family}" --bdr "#${colors.base03}" --tb "#${colors.base00}" --fb "#${colors.base00}" --nb "#${colors.base00}" --hb "#${colors.base00}" --tf "#${colors.base09}" --ff "#${colors.base05}" --nf "#${colors.base05}" --hf "#${colors.base09}"
  '';
in
{
  
  xdg.configFile."hyprland/scripts/pipewire.sh" = {
    executable = true;
    text = ''
      ${pkgs.bemenu-pipewire}/bin/bemenu-pipewire} ${bemenu-args}
    '';
  };

}
