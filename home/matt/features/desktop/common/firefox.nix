{ config, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.matt = {
      bookmarks = { };
      extensions = with config.nur.repos.rycee.firefox-addons; [
        bitwarden
        firefox-color
        privacy-badger
        simple-tab-groups
        sponsorblock
        ublock-origin
      ];
      settings = {
        "browser.startup.page" = 3;
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "text/xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };
}
