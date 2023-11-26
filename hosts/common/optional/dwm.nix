{ pkgs, ... }:

{
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.unstable.dwm.overrideAttrs (old: rec {
      patches = [
      (fetchpatch {
        url = "https://raw.githubusercontent.com/aiecee/dwm/patched/dwm-nixos.diff";
        sha256 = "";
      })
      ];
    });
  };
}
