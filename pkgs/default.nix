{ pkgs ? import <nixpkgs> { } }: rec {

  catppuccin-sddm = pkgs.libsForQt5.callPackage ./catppuccin-sddm.nix { };
  bemenu-pipewire = pkgs.callPackage ./bemenu-pipewire.nix { };
  dmenu-pipewire = pkgs.callPackage ./dmenu-pipewire.nix { };
  dmenu-pipewire = pkgs.callPackage ./dmenu-power.nix { };

}
