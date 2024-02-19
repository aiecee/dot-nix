{ ... }:

{
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks = {
      aiecee = {
        host = "aiecee";
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/aiecee";
      };
      huel-matt = {
        host = "huel-matt";
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/huel-matt";
      };
    };
  };
}
