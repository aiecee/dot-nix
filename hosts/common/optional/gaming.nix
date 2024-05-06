{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = false;
      package = pkgs.unstable.steam;
    };
  };
}
