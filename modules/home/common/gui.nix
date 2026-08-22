{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };

    gtk4.theme = null;
    gtk4.extraConfig = {
      gtk-cursor-theme-name = "Breeze_Light";
      gtk-cursor-theme-size = 24;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.breeze;
    name = "Breeze_Light";
    size = 24;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Breeze_Light";
      cursor-size = 24;
    };
  };

  home.sessionVariables = {
    ADW_DEBUG_COLOR_SCHEME = "prefer-dark";
  };
}
