{ ... }:

{
  programs.git = {
    enable = true;
    userName = "aiecee";
    userEmail = "mattycov@googlemail.com";
    aliases = {
      yolo = ''git commit -m "$(curl -sL http://whatthecommit.com/index.txt)"'';
    };
  };
}
