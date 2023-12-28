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

        vim.keymap.set("n", "<Leader>t", "<cmd>Neotree toggle<cr>", { desc = "file tree" })
        vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find" })
        vim.keymap.set("n", "<Leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "recently opened" })
        vim.keymap.set("n", "<Leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "current file" })
        vim.keymap.set("n", "<Leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "word under cursor" })
        vim.keymap.set("n", "<Leader>sw", "<cmd>Telescope live_grep<cr>", { desc = "current working dir" })

        local miniclue = require("mini.clue")
        miniclue.setup({
          triggers = {
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },
            { mode = "n", keys = "g"},
            { mode = "x", keys = "g"},
          },
          clues = {
            { mode = "n", keys = "<Leader>f", desc = "+Files" },
            { mode = "n", keys = "<Leader>s", desc = "+Search" },
            miniclue.gen_clues.g(),
            miniclue.gen_clues.windows(),
          },
          window = {
            config = {
              width = "auto",
              anchor = "SW",
            },
            delay = 0,
          },
        })
        require("mini.comment").setup()
        require("mini.cursorword").setup()
        require("mini.indentscope").setup({
          symbol = "|",
        })
        require("mini.jump").setup()
        require("mini.jump2d").setup()
        require("mini.move").setup({
          mappings = {
            left = "<S-h>",
            right = "<S-l>",
            up = "<S-k>",
            down = "<S-j>",

            line_left = "<S-h>",
            line_right = "<S-l>",
            line_up = "<S-k>",
            line_down = "<S-j>",
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
    }
  ];

}
