{pkgs, ...}: {
  imports = [./niri];

  programs.waybar = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty -e";
        layer = "overlay";
      };
    };
  };

  home.packages = [
    pkgs.gtklock
  ];

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      "before-sleep" = "${pkgs.gtklock}/bin/gtklock";
    };
  };

  services.swayosd.enable = true;
  services.swaync.enable = true;
}
