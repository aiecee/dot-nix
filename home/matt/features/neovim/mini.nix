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

        local minifiles = require("mini.files")
        minifiles.setup({
          windows = {
            preview = true,
          },
        })

        local map_split = function(buf_id, lhs, direction)
          local rhs = function()
            -- Make new window and set it as target
            local new_target_window
            vim.api.nvim_win_call(minifiles.get_target_window(), function()
              vim.cmd(direction .. ' split')
              new_target_window = vim.api.nvim_get_current_win()
            end)
              minifiles.set_target_window(new_target_window)
          end
            -- Adding `desc` will result into `show_help` entries
          local desc = 'Split ' .. direction
          vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
        end

        vim.api.nvim_create_autocmd('User', {
          pattern = 'MiniFilesBufferCreate',
          callback = function(args)
            local buf_id = args.data.buf_id
            -- Tweak keys to your liking
            map_split(buf_id, 'gs', 'belowright horizontal')
            map_split(buf_id, 'gv', 'belowright vertical')
          end,
        })

        local mini_clue = require("mini.clue")
        local clue_config = {
          triggers = {
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },
          },
          clues = {
            { mode = "n", keys = "<Leader>c", desc = "+Code" },
            { mode = "n", keys = "<Leader>f", desc = "+Files" },
            { mode = "n", keys = "<Leader>g", desc = "+Git" },
            { mode = "n", keys = "<Leader>m", desc = "+Marks" },
            { mode = "n", keys = "<Leader>s", desc = "+Search" },
            { mode = "n", keys = "<Leader>S", desc = "+Sessions" },
            { mode = "n", keys = "<Leader>w", desc = "+Windows" },
            mini_clue.gen_clues.g(),
            mini_clue.gen_clues.windows(),
          },
          window = {
            config = {
              width = "auto",
              anchor = "SW",
            },
            delay = 0,
          },
        }
        mini_clue.setup(clue_config)
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
