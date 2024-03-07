{ ... }:

{
  imports = [
    ./common/global/nix.nix
    ./common/global/zsh.nix
  ]

    services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 4;
}
