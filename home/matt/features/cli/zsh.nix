{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cd = "eza";
      md = "mkdir -p";
      mkdir = "mkdir -p";
      cat = "bat";
    };
  };
}
