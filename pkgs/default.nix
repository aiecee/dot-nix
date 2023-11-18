{ pkgs ? import <nixpkgs> { } }: rec {

  catppuccin-sddm = pkgs.callPackage ./catppuccin-sddm { };

}
