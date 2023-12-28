{ config, ... }:

{

  programs.neovim.extraLuaConfig = ''
    function set_global_opt(key, value)
      vim.g[key] = value
    end

    function set_opt(key, value)
      vim.opt[key] = value
    end

    set_global_opt("mapleader", " ")

    set_opt("shell", "zsh")
    set_opt("completeopt", { "menu", "menuone", "preview", "noselect" })
    set_opt("number", true)
    set_opt("relativenumber", true)
    set_opt("scrolloff", 10)
    set_opt("errorbells", false)
    set_opt("tabstop", 2)
    set_opt("softtabstop", 2)
    set_opt("expandtab", true)
    set_opt("shiftwidth", 2)
    set_opt("wrap", false)
    set_opt("swapfile", false)
    set_opt("backup", false)
    set_opt("signcolumn", "yes")
    set_opt("cmdheight", 1)
    set_opt("colorcolumn", "150")
    set_opt("timeoutlen", 250)
    set_opt("autoread", true)
    set_opt("termguicolors", true)
    set_opt("guifont", "${config.customFonts.monospace.family}:h12")
    set_opt("foldmethod", "expr")
    set_opt("foldexpr", "nvim_treesitter#foldexpr()")
    set_opt("foldlevelstart", 99)
    set_opt("fileformat", "unix")
    set_opt("laststatus", 3)
    set_opt("clipboard", "unnamedplus")
    set_opt("updatetime", 750)
    set_opt("title", true)
  '';

}
