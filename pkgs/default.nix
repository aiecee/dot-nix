{ pkgs ? import <nixpkgs> { } }: rec {

  catppuccin-sddm = pkgs.libsForQt5.callPackage ./catppuccin-sddm.nix { };
  bemenu-pipewire = pkgs.callPackage ./bemenu-pipewire.nix { };

}
