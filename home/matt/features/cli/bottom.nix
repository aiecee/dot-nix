{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottom
  ];

  xdg.configFile."/bottom/bottom.toml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/bottom/main/themes/frappe.toml";
    hash = "";
  };
}
