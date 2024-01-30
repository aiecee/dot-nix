{ pkgs, ... }:
let
  myllama = pkgs.vimUtils.buildVimPlugin {
    name = "myllama";
    src = ~/projects/neovim-plugins/ollama-myllama.nvim;
  };
in 
{
  programs.neovim.plugins = [
    {
      plugin = myllama;
      type = "lua";
      config = '''';
    }
  ];
}
