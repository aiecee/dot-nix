{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    shellAliases = {
      md = "mkdir -p";
      mkdir = "mkdir -p";
      cat = "bat";
    };
  };
}
