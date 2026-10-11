{pkgs, ...}: {
  home.packages = [
    pkgs.trackma-qt
  ];

  xdg.configFile."trackma/config.json" = {
    source = ./config.json;
    force = true;
  };
  xdg.configFile."trackma/ui-qt.json" = {
    source = ./ui-qt.json;
    force = true;
  };

  systemd.user.services.trackma = {
    Unit = {
      Description = "Trackma - Open multi-site list manager for Unix-like systems";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.trackma-qt}/bin/trackma-qt";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
