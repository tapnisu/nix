{pkgs, ...}: {
  systemd.user.services.throne = {
    Unit = {
      Description = "Throne Proxy Client";
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
