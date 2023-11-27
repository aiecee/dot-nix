{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "XF86AudioRaiseVolume" = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "mod4 + Return" = "kitty";
      "mod4 + a" = ''${pkgs.dmenu-pipewire}/bin/dmenu-pipewire'';
      "mod4 + p" = ''${pkgs.dmenu-power}/bin/dmenu-power'';
      "mod4 + b" = "firefox";
      "mod4 + r" = ''dmenu_run -p "Run"'';
      "mod4 + shift + r" = "pkill -USR1 -x sxhkd";
      "mod4 + x" = "maim -s | xclip -selection clipboard -t image/png";
      "mod4 + shift + x" = "maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png";
    };
  };

}
