{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-notify;
      type = "lua";
      config = ''vim.notify = require("notify")'';
    }

  ];
}
