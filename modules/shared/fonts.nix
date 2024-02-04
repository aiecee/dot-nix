{ lib, ... }:
let
  mkFontOption = kind: {
    family = lib.mkOption {
      type = lib.types.str;
      description = "Family name for ${kind} font.";
      default = null;
    };
    package = lib.mkOption {
      type = lib.types.package;
      description = "Package for ${kind} font.";
      default = null;
    };
  };
in
{
  options.customFonts = {
    enable = lib.mkEnableOption "Whether to enable custom fonts";
    monospace = mkFontOption "monospace";
    serif = mkFontOption "serif";
    sansSerif = mkFontOption "sansSerif";
    emoji = mkFontOption "emoji";
  };
}
