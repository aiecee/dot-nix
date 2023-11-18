{ pkgs, ... }:

{
  programs.btop.enable = true;

  xdg.configFile."btop/themes/catppuccin_frappe.theme".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_frappe.theme";
    hash = "sha256-+wQZ09rhiz74OllJL/z25rLKfB3C7qh6j/WjayYsHpw=";
  };
}
