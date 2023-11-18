{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    shellAliases = {
      md = "mkdir -p";
      mkdir = "mkdir -p";
      cat = "bat";
    };
  };
}
