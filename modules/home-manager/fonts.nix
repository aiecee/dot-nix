{ lib, config, ... }:

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
  cfg = config.customFonts;
in
{
  options.customFonts = {
    enable = lib.mkEnableOption "Whether to enable custome fonts";
    monospace = mkFontOption "monospace";
    regular = mkFontOption "regular";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [ cfg.monospace.package cfg.regular.package ];
  };
}
