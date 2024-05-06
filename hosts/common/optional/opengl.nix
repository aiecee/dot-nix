{ pkgs, ... }:

{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs.unstable; [ mesa ];
    };
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
}
