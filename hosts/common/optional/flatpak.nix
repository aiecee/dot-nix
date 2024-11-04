{ pkgs, ... }: {
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # extraPortals = with pkgs;
    #   [
    #     xdg-desktop-portal-hyprland
    #     xdg-desktop-portal-gtk
    #   ];
    config.common.default = [
      "hyprland"
      "gtk"
    ];
  };
}
