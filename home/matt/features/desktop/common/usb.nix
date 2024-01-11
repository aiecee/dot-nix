{ pkgs, ... }:

{
  
  home.packages = with pkgs; [
    udiskie
  ];

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "never";
  };

}
