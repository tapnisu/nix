{pkgs, ...}: {
  home.packages = [
    pkgs.throne
  ];

  systemd.user.services.throne = {
    Unit = {
      Description = "Throne - Cross-platform GUI proxy utility ";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.throne}/bin/Throne";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
