{ inputs, lib, pkgs, config, outputs, ... }:

let
  inherit (inputs.nix-colors) colorSchemes;
in
{
  imports = [
    inputs.nix-colors.homeManagerModules
  ] ++ (buitlins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flakes" ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home = {
    username = "matt";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };

  colorScheme = colorSchemes.catppuccin-frappe;

}
