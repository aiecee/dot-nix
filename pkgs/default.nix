{ pkgs ? import <nixpkgs> { } }: rec {

  catppuccin-sddm = pkgs.libsForQt5.callPackage ./catppuccin-sddm.nix { };
  bemenu-pipewire = pkgs.callPackage ./bemenu-pipewire.nix { };
  dmenu-pipewire = pkgs.callPackage ./dmenu-pipewire.nix { };
  dmenu-power = pkgs.callPackage ./dmenu-power.nix { };
  dmenu-kill-process = pkgs.callPackage ./dmenu-kill-process.nix { };
  dmenu-bitwarden = pkgs.callPackage ./dmenu-bitwarden.nix { };

}
