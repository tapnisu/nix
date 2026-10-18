{pkgs, ...}: {
  programs.wleave = {
    enable = true;
    settings = {
      button-defaults = {
        keybind-label = "%S";
      };
      show-keybinds = true;
      no-version-info = true;
      buttons = [
        {
          label = "lock";
          action = [
            {executable = "gtklock";}
          ];
          text = "Lock";
          keybind = "l";
          icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
          icon = "${pkgs.wleave}/share/wleave/icons/hibernate.svg";
        }
        {
          label = "logout";
          action = [
            {
              "$DESKTOP_SESSION" = "niri";
              shell = "niri msg action quit --skip-confirmation";
            }
            {
              "$DESKTOP_SESSION" = "sway";
              shell = "swaymsg exit";
            }
            {
              "$DESKTOP_SESSION" = "plasma";
              shell = "qdbus org.kde.KWin /Session org.kde.KWin.Session.quit";
            }
            {
              "$DESKTOP_SESSION" = "gnome";
              shell = "gnome-session-quit --no-prompt";
            }
            "loginctl terminate-user $USER"
          ];
          text = "Logout";
          keybind = "e";
          icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
          icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
          icon = "${pkgs.wleave}/share/wleave/icons/suspend.svg";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
          icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
        }
      ];
    };
    style = builtins.readFile ./style.css;
  };
}
