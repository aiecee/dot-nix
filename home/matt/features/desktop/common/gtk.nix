{ pkgs, ... }:

{

  home.packages = with pkgs; [ dconf ];

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.catppuccin-cursors.frappeDark;
      name = "Catppuccin-Frappe-Dark-Cursors";
      size = 24;
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "green";
      };
      name = "Papirus Dark";
    };
    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "compact";
        variant = "frappe";
      };
      name = "Catppuccin-Frappe-Compact-Green-Dark;":
      };
    };

    home.pointerCurosr = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.catppuccin-cursors.frappeDark;
      name = "Catppuccin-Frappe-Dark-Cursors";
      size = 24;
    };

  }
