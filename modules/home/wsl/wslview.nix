{pkgs, ...}: {
  home.packages = [pkgs.wsl-open];

  home.sessionVariables = {
    BROWSER = "wsl-open";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["wsl-open.desktop"];
    "x-scheme-handler/http" = ["wsl-open.desktop"];
    "x-scheme-handler/https" = ["wsl-open.desktop"];
    "x-scheme-handler/about" = ["wsl-open.desktop"];
    "x-scheme-handler/unknown" = ["wsl-open.desktop"];
  };
}
