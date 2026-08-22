{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = ["ru"];
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "browser.shell.checkDefaultBrowser" = false;
      };
    };
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    BROWSER = "firefox";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
    "x-scheme-handler/about" = ["firefox.desktop"];
    "x-scheme-handler/unknown" = ["firefox.desktop"];
  };
}
