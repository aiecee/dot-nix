{ libs, config, ... }:

let
  cfg = config.hyprland;
in
{
  options.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };


}
