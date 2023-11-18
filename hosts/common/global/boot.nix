{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };

      efi = {
        canTouchEfiVariables = true;
      };

      plymouth = {
        enable = true;
        themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "frappe"; }) ];
        theme = "catppuccin-frappe";
      };

      kernelParams = [ "quiet" ];
    };

  }
