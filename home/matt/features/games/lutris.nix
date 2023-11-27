{ pkgs, ... }:

{
  home.packages = [
    (pkgs.lutris.override {
      extraPkgs = p: [
        p.wineWowPackages.full
        p.python3
        p.zulu
      ];
    })
  ];
}
