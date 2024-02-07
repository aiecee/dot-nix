{ pkgs, config, ... }:
let
  inherit (config.colorScheme) palette;
  toColor = color: "#${color}";
in
{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = mini-nvim;
      type = "lua";
      config = ''
        require("mini.base16").setup({
          palette = {
            base00 = "${toColor palette.base00}",
            base01 = "${toColor palette.base01}",
            base02 = "${toColor palette.base02}",
            base03 = "${toColor palette.base03}",
            base04 = "${toColor palette.base04}",
            base05 = "${toColor palette.base05}",
            base06 = "${toColor palette.base06}",
            base07 = "${toColor palette.base07}",
            base08 = "${toColor palette.base08}",
            base09 = "${toColor palette.base09}",
            base0A = "${toColor palette.base0A}",
            base0B = "${toColor palette.base0B}",
            base0C = "${toColor palette.base0C}",
            base0D = "${toColor palette.base0D}",
            base0E = "${toColor palette.base0E}",
            base0F = "${toColor palette.base0F}",
          },
          use_cterm = true,
        })
        --vim.api.nvim_set_hl(0, "FloatBorder", { link = "FloatTitle "})
      '';
    }
  ];

}
