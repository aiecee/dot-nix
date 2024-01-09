{ pkgs, ... }:

{

  imports = [
    ./base16.nix
    ./clues.nix
    ./files.nix
    ./hipatterns.nix
    ./indentscope.nix
    ./move.nix
    ./statusline.nix
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = mini-nvim;
      type = "lua";
      config = ''
        require("mini.ai").setup()
        require("mini.animate").setup()
        require("mini.bracketed").setup()
        require("mini.comment").setup()
        require("mini.cursorword").setup()
        require("mini.jump").setup()
        require("mini.jump2d").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()
      '';
    }
  ];

}
