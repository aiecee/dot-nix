{ pkgs, lib, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-treesitter-refactor
    nvim-treesitter-context
    nvim-ts-autotag
    {
      plugin = nvim-treesitter;
      type = "lua";
      config = ''
        local tsInstall = require("nvim-treesitter.install")
        local tsconfig = require("nvim-treesitter.configs")
        
        install.compilers = { "clang", "gcc" }
        config.setup({
				  ensure_installed = {
		  			"lua",
		  			"typescript",
		  			"javascript",
		  			"tsx",
		  			"rust",
		  			"go",
		  			"markdown",
		  			"json",
		  			"css",
		  			"scss",
		  			"html",
		  			"python",
		  			"bash",
		  			"yaml",
		  		},
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
        install.update({ with_sync = true })
      '';
    }
  ];
}
