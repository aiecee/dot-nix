{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];

  services.xserver = {
    enable = true;
    layout = "gb";
    displayManager = {
      defaultSession = "none+dwm";
      sddm = {
        enable = true;
        theme = "chili";
        settings = {
          Theme = {
            CursorTheme = "Bibata-Modern-Ice";
            CursorSize = 24;
            Font = "NotoSans NF";
          };
        };
      };

    };
  };

}
