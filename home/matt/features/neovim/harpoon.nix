{ pkgs, ... }: 

{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    plenary-nvim
    {
      plugin = harpoon.override {
        src = fetchFromGitHub {
          owner = "ThePrimeagen";
          repo = "harpoon";
          rev = "harpoon2";
          hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };
      };
      type = "lua";
      config = ''
        local harpoon = require("harpoon")
        harpoon:setup()
      '';
    }
  ];

}
