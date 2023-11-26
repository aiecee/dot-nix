{ pkgs, ... }:

{
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.unstable.dwm.overrideAttrs (old: rec {
      patches = [
        ./dwm-nixos.diff
      ];
    });
  };
}
