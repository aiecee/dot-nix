{ pkgs, lib, config, ... }:
let
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  pgrep = "${pkgs.procps}/bin/pgrep";
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  # 4 minute lock time
  lockTime = 4 * 60;
  isLocked = "${pgrep} -x ${swaylock}";
  # makes two timeouts: one for when the screen is not locked (lockTime+timeout) and one for when it is.
  afterLockTimeout = { timeout, command, resumeCommand ? null }: [
    { timeout = lockTime + timeout; inherit command resumeCommand; }
    { command = "${isLocked} && ${command}"; inherit resumeCommand timeout; }
  ];
in
{
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts = [
      # lock screen
      {
        timeout = lockTime;
        command = "${swaylock} --daemonize";
      }
    ] ++
    # turn off displays
    (afterLockTimeout {
      timeout = 40;
      command = "${hyprctl} dispatch dpms off";
      resumeCommand = "${hyprctl} dispatch dpms on";
    });
  };
}
