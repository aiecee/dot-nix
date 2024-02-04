{ pkgs, ... }:
let
  harpoon2 = pkgs.vimUtils.buildVimPlugin {
    name = "harpoon2";
    src = pkgs.fetchFromGitHub {
      owner = "ThePrimeagen";
      repo = "harpoon";
      rev = "harpoon2";
      hash = "sha256-MUIGRoaFcCqqFatfnFJpnEOUmSYJgV2+teU/NXj6kgY=";
    };
  };
in 

{
  home.packages = with pkgs; [
    selene
    stylua
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = trouble-nvim;
      type = "lua";
      config = ''
        local trouble = require("trouble")
        trouble.setup()
      '';
    }
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        local gitsigns = require("gitsigns")
        gitsigns.setup({
          current_line_blame = true,
        })
      '';
    }
    {
      plugin = harpoon2;
      type = "lua";
      config = ''
        require("harpoon"):setup()
      '';
    }
    {
      plugin = guard-collection;
      type = "lua";
    }
    {
      plugin = guard-nvim;
      type = "lua";
      config = ''
        local ft = require("guard.filetype")
        
        ft("lua"):fmt("lsp")
          :append("stylua")
          :lint("selene")

        require("guard").setup({
          fmt_on_save = true,
          lsp_as_default_formatter = true,
        })
      '';
    }
  ];
}
