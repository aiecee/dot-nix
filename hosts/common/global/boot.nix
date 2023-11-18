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

    };
    kernelParams = [ "quiet" ];

    plymouth = {
      enable = true;
      themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "frappe"; }) ];
      theme = "catppuccin-frappe";
    };
  };

}
