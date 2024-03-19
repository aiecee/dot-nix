{ pkgs, lib, config, ... }:
let
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  # 4 minute lock time
  lockTime = 10 * 60;
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
    ];
  };
}
