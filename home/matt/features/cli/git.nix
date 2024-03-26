{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "aiecee";
      userEmail = "mattycov@googlemail.com";
      aliases = {
        yolo = ''git commit -m "$(curl -sL http://whatthecommit.com/index.txt)"'';
      };
      difftastic = {
        enable = true;
        color = "always";
        display = "side-by-side";
      };
    };

    lazygit = {
      enable = true;
      package = pkgs.unstable.lazygit;
      settings = {
        git.paging.externalDiffCommand = "difft";
      };
    };
  };
}
