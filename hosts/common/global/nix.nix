{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
    optimise = {
      automatic = true;
    };
    settings = {
      experimental-features = [ "nix-commands" "flakes" ];
      warn-dirty = false;
    };
  };
}
