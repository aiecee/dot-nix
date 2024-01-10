{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    nvim-web-devicons
    {
      plugin = nvim-notify;
      type = "lua";
      config = ''vim.notify = require("notify")'';
    }

  ];
}
