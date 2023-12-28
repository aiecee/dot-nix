{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-ui-select-nvim
    telescope-file-browser-nvim
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
        local telescope = require("telescope")
        local telescope_themes = require("telescope.themes")

        telescope.setup({
          pickers = {
            find_files = {
              theme = "dropdown",
            },
            buffers = {
              theme = "dropdown",
            },
            lsp_definitions = {
              theme = "dropdown",
            },
            lsp_implementations = {
              theme = "dropdown",
            }, 
            lsp_references = {
              theme = "dropdown",
            },
            diagnostics = {
              theme = "dropdown",
            },
          },
          extensions = {
            ["ui-select"] = {
              telescope_themes.get_dropdown(),
            },
          },
        })

        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
      '';
    }
  ];
}
