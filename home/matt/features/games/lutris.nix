{ pkgs, ... }:

{
  home.packages = [
    (pkgs.lutris.override {
      extraPkgs = p: [
        p.unstable.wineWowPackages.full
        p.python3
        p.zulu
      ];
    })
  ];
}
