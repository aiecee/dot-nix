{ ... }:

{
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    dates = "daily";
    flake = "github:aiecee/dotfiles-nix";
    flags = [
      "--refresh"
      "--recreate-lock-file"
      "--commit-lock-file"
    ];
  };
}
