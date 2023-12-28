{ pkgs, config, ... }:
let
  inherit (config.colorScheme) colors;
  toColor = color: "#${color}";
in
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = mini-nvim;
      type = "lua";
      config = ''
        require("mini.ai").setup()
        require("mini.animate").setup()
        require("mini.base16").setup({
          palette = {
            base00 = "${toColor colors.base00}",
            base01 = "${toColor colors.base01}",
            base02 = "${toColor colors.base02}",
            base03 = "${toColor colors.base03}",
            base04 = "${toColor colors.base04}",
            base05 = "${toColor colors.base05}",
            base06 = "${toColor colors.base06}",
            base07 = "${toColor colors.base07}",
            base08 = "${toColor colors.base08}",
            base09 = "${toColor colors.base09}",
            base0A = "${toColor colors.base0A}",
            base0B = "${toColor colors.base0B}",
            base0C = "${toColor colors.base0C}",
            base0D = "${toColor colors.base0D}",
            base0E = "${toColor colors.base0E}",
            base0F = "${toColor colors.base0F}",
          },
          use_cterm = true,
        })
        require("mini.bracketed").setup()
        require("mini.comment").setup()
        require("mini.cursorword").setup()
        require("mini.indentscope").setup({
          symbol = "|",
        })
        require("mini.jump").setup()
        require("mini.jump2d").setup()
        require("mini.move").setup({
          mappings = {
            left = "<C-h>",
            right = "<C-l>",
            up = "<C-k>",
            down = "<C-j>",

            line_left = "<C-h>",
            line_right = "<C-l>",
            line_up = "<C-k>",
            line_down = "<C-j>",
          },
        })
        require("mini.pairs").setup()
        require("mini.statusline").setup({
          content = {
            active = nil,
            inactive = nil,
          },
          use_icons = true,
          set_vim_settings = false,
        })
        require("mini.surround").setup()
      '';

  ]

}
