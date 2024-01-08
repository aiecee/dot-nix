{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = nvim-notify;
      type = "lua";
      config = ''vim.notify = require("notify")'';
    }

  ];
}
