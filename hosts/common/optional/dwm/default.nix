{ pkgs, ... }:

{
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.unstable.dwm.override  {
      patches = [
        ./dwm-nixos.diff
      ];
    };
  };
}
