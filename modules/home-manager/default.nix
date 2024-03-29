# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{

  monitors = import ../shared/monitors.nix;
  customFonts = import ./fonts.nix;
  wallpaper = import ./wallpaper.nix;
  customCursor = import ./cursor.nix;
  customIcons = import ./icons.nix;
  customGtkTheme = import ./gtktheme.nix;

}
