{pkgs, ...}: {
  # https://wiki.nixos.org/wiki/Swayidle
  services.swayidle = let
    lock = "${pkgs.gtklock}/bin/gtklock --daemonize";
    display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
  in {
    enable = true;
    timeouts = [
      {
        timeout = 600; # in seconds
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 30 seconds' -t 30000";
      }
      {
        timeout = 630;
        command = lock;
      }
      {
        timeout = 635;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 640;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      "before-sleep" = (display "off") + "; " + lock;
      "after-resume" = display "on";
      "lock" = (display "off") + "; " + lock;
      "unlock" = display "on";
    };
  };
}
