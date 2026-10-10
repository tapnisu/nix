{pkgs, ...}: {
  home.packages = with pkgs; [
    trackma-qt
  ];

  xdg.configFile."trackma/config.json".source = ./config.json;
  xdg.configFile."trackma/ui-qt.json".source = ./ui-qt.json;
}
