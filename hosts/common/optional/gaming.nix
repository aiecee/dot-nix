{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      package = pkgs.unstable.steam;
    };
  };
}
