{ ... }:

{

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "dwm";
        user = "matt";
      };
    };
  };

  programs.regreet.enable = true;

}
