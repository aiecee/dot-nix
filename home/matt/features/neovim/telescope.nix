{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    plenary-nvim
    telescope-ui-select-nvim
    telescope-file-browser-nvim
    trouble-nvim
    {
      plugin = telescope-nvim;
      type = "lua";
      config = ''
                local telescope = require("telescope")
                local telescope_themes = require("telescope.themes")
                local trouble_telescope = require("trouble.sources.telescope")

                telescope.setup({
                defaults = {
        				mappings = {
        					i = { ["<c-t>"] = trouble_telescope.open },
        					n = { ["<c-t>"] = trouble_telescope.open },
        				},
        			},
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
