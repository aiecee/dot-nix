{ pkgs, ... }:

{
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "Noto" ]; }) ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "NotoSerif Nerd Font" ];
      sansSerif = [ "NotoSans Nerd Font" ];
      monospace = [ "NotoMono Nerd Font" ];
    };
  };

}