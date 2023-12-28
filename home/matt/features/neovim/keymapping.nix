{ ... }:

{
  programs.neovim.extraLuaConfig = ''
    vim.keymap.set("n", "<Leader>uu", vim.notify("hello"), { desc = "Say Hello" })
    vim.keymap.set("n", "<Leader>ui", vim.notify("goodbye"), { desc = "Say Goodbye" })
  '';
}
