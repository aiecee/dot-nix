{ lib, ... }:
let
  mkFontOption = kind: {
    family = lib.mkOption {
      type = lib.types.stf;
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
  options.rice.fonts = {
    enable = lib.mkEnableOptions "Whether to enable custom fonts";
    monospace = mkFontOption "monospace";
    serif = mkFontOption "serif";
    sansSerif = mkFontOption "sansSerif";
    emoji = mkFontOption "emoji";
  };
}
