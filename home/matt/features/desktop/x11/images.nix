{ pkgs, ... }:

{

  home.packages = with pkgs; [
    feh
    gimp-with-plugins
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = [ "feh.desktop" ];
      "image/jpeg" = [ "feh.desktop" ];
    };
  };

}
