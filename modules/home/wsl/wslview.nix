{pkgs, ...}: let
  wslview = pkgs.writeShellScriptBin "wslview" ''
    exec cmd.exe /c start "" "$@"
  '';
in {
  home.packages = [wslview];

  home.sessionVariables = {
    BROWSER = "wslview";
  };

  xdg.desktopEntries.wslview = {
    name = "wslview";
    comment = "Open URL in default Windows browser";
    exec = "${wslview}/bin/wslview %u";
    terminal = false;
    type = "Application";
    mimeTypes = [
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["wslview.desktop"];
    "x-scheme-handler/http" = ["wslview.desktop"];
    "x-scheme-handler/https" = ["wslview.desktop"];
    "x-scheme-handler/about" = ["wslview.desktop"];
    "x-scheme-handler/unknown" = ["wslview.desktop"];
  };
}
