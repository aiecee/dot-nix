{
  customFonts = import ./fonts.nix;
  customCursor = import ./cursor.nix;
  customIcons = import ../shared/icons.nix;
  customGtkTheme = import ../shared/gtktheme.nix;
  monitors = import ../shared/monitors.nix;
}
