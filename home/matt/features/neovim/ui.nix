{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    plenary-nvim
    nvim-web-devicons
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        require("neo-tree").setup({
          popup_border_style = "rounded",
          filesystem = {
            follow_current_file = {
              enabled = true,
              leave_dirs_open = true,
	          },
          },
          window = {
            mappings = {
              ["T"] = "toggle_node",
              ["<space>"] = ""
            },
            position = "float",
          },
        }) 
      '';
    }
    {
      plugin = nvim-notify;
      type = "lua";
      config = ''vim.notify = require("notify")'';
    }

  ];
}
