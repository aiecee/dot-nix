{ pkgs, config, ... }:
let
  inherit (config.colorScheme) colors;
  toColor = color: "#${color}";
in
{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
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
        local show_dotfiles = true

        local filter_show = function(fs_entry) return true end

        local filter_hide = function(fs_entry)
          return not vim.startswith(fs_entry.name, '.')
        end

        local toggle_dotfiles = function()
          show_dotfiles = not show_dotfiles
          local new_filter = show_dotfiles and filter_show or filter_hide
          MiniFiles.refresh({ content = { filter = new_filter } })
        end

        vim.api.nvim_create_autocmd('User', {
          pattern = 'MiniFilesBufferCreate',
          callback = function(args)
            local buf_id = args.data.buf_id
            -- Tweak left-hand side of mapping to your liking
            vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
          end,
        })

        local function map_table(table)
          for mode, mappings in pairs(table) do
            for _, mapping in pairs(mappings) do
              vim.keymap.set(mode, mapping[1], mapping[2], vim.tbl_extend("keep", { desc = mapping[3] }, mapping[4] or {}))
            end
          end
        end

        local global_mappings = {
          n = {
            -- commands
            { "<Leader>-", "<cmd>Telescope commands<cr>", "commands" },
            -- files
            { "<Leader>t", function() require("mini.files").open() end, "file tree" },
            { "<Leader>ff", "<cmd>Telescope find_files<cr>", "find" },
            { "<Leader>fr", "<cmd>Telescope oldfiles<cr>", "recently opened" },
            -- search
            { "<Leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
            { "<Leader>sc", "<cmd>Telescope grep_string<cr>", "word under cursor" },
            { "<Leader>sw", "<cmd>Telescope live_grep<cr>", "current working dir" },
            -- git
            { "<Leader>gcc", "<cmd>Telescope git_commits<cr>", "commits" },
            { "<Leader>gcb", "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
            { "<Leader>gb", "<cmd>Telescope git_branches<cr>", "branches" },
            -- sessions
            -- { "<Leader>Sc", persistence.load, "load" },
            -- {
            --   "<Leader>Sl",
            --   function()
            --     persistence.load({ last = true })
            --   end,
            --   "load last",
            -- },
            -- windows
            { "<Leader>=", "<cmd>wincmd =<cr>", "format" },
            { "<Leader>wh", "<cmd>wincmd h<cr>", "go left" },
            { "<Leader>wj", "<cmd>wincmd j<cr>", "go down" },
            { "<Leader>wk", "<cmd>wincmd k<cr>", "go up" },
            { "<Leader>wl", "<cmd>wincmd l<cr>", "go right" },
            { "<Leader>ws", "<cmd>wincmd w<cr>", "split" },
            { "<Leader>wv", "<cmd>wincmd v<cr>", "split vertically" },
            { "<Leader>wx", "<cmd>wincmd x<cr>", "swap" },
            -- marks
            -- {
            --   "<Leader>ma",
            --   function()
            --     harpoon:list():append()
            --   end,
            --   "add",
            -- },
            -- {
            --   "<Leader>mn",
            --   function()
            --     harpoon:list():next()
            --   end,
            --   "next",
            -- },
            -- {
            --   "<Leader>mp",
            --   function()
            --     harpoon:list():prev()
            --   end,
            --   "previous",
            -- },
            -- { "<Leader>ml", "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" },
            { "ga", vim.lsp.buf.code_action, "[LSP] code actions" },
            { "gr", "<cmd>Telescope lsp_references<cr>", "[LSP] references" },
            { "gb", "<cmd>Telescope lsp_definitions<cr>", "[LSP] definitions" },
            { "gR", vim.lsp.buf.rename, "[LSP] rename" },
            { "gh", vim.lsp.buf.hover, "[LSP] hover" },
            {
              "gd",
              function()
                vim.diagnostic.open_float({ border = "rounded" })
              end,
              "[LSP] diagnostics",
            },
            { "<Leader>cb", "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
            { "<Leader>ci", "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
            { "<Leader>cr", "<cmd>Telescope lsp_references<cr>", "all references" },
            { "<Leader>cd", "<cmd>Telescope diagnostics<cr>", "diagnostics" },
            {
              "<Leader>cf",
              function()
                vim.lsp.buf.format({ timeout_ms = 5000 })
              end,
              "format",
            },
            { "<Leader>ca", vim.lsp.buf.code_action, "code actions" },
            { "<Leader>cr", vim.lsp.buf.rename, "rename" },
            { "<Leader>ch", vim.lsp.buf.hover, "hover" },
            { "<Leader>ct", "<cmd>TodoTelescope<cr>", "todos" },
          },
        }

        map_table(global_mappings)

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
