{ ... }:

{
  services.ssh-agent.enable = true;


  programs.ssh = {
    enable = true;
    matchBlocks = {
      aiecee = {
        host = "aiecee";
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/aiecee";
      };
      huel-matt = {
        host = "huel-matt";
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/huel-matt";
      };
    };
  };
}
