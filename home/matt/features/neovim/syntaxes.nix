{ pkgs, ... }:

{


  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    nvim-treesitter-refactor
    nvim-treesitter-context
    nvim-ts-autotag
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = ''
        local tsConfig = require("nvim-treesitter.configs")
        tsConfig.setup({
          highlight = {
            enable = true,
          },
          incremental_selection = {
            enable = true,
          },
          indent = {
            enable = true,
          },
          refactor = {
            highlight_definitions = {
              enable = true,
              clear_cursor_on_move = true,
            },
            highlight_current_scope = {
              enable = false,
            },
          },
        })
      '';
    }
  ];
}
