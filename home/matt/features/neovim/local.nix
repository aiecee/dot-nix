{ pkgs, ... }:
let
  myllama = pkgs.vimUtils.buildVimPlugin {
    name = "myllama";
    src = /home/matt/projects/neovim-plugins/myllama.nvim;
  };
in 
{
  programs.neovim.plugins = [
    {
      plugin = myllama;
      type = "lua";
      config = ''
        require("myllama"):setup()
      '';
    }
  ];
}
