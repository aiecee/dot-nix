{ pkgs, ... }:

{
  home.packages = [
    (pkgs.lutris.override {
      extraPkgs = p: [
        p.wineWowPackages.waylandFull
        p.python3
        p.zulu
      ];
    })
  ];
}
