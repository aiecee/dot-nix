{ pkgs, ...}:

{

  home.packages = with pkgs; [
    feh
    imagemagick
  ];

  xdg.mimeApps.defaultApplications = {
    "image/png" = [ "feh.desktop" ];
    "image/jpeg" = [ "feh.desktop" ];
  };

}
