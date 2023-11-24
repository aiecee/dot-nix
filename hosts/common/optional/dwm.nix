{ pkgs, ... }:

{
  service.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.unstable.dwm.overrideAttrs (old: rec {
      patches = with pkgs; [
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff";
          sha256 = "";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/xresources/dwm-xresources-20210827-138b405.diff";
          sha256 = "";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/xresources/dwm-xresources-20210827-138b405.diff";
          sha256 = "";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/swallow/dwm-swallow-6.3.diff";
          sha256 = "";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/colorbar/dwm-colorbar-6.3.diff";
          sha256 = "";
        })
        (fetchpatch {
          url = "https://dwm.suckless.org/patches/cursorwarp/dwm-cursorwarp-6.3.diff";
          sha256 = "";
        })
      ];
    });
  };
}
