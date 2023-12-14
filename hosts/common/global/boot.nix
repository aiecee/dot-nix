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
      themePackages = with pkgs; [
        (catppuccin-plymouth.override { variant = "frappe"; })
        (adi1090x-plymouth-themes.override { selected_themes = [ "colorful_loop" ]; })
      ];
      theme = "colorful_loop";
    };
  };

}
