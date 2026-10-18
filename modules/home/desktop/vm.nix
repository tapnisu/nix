{pkgs, ...}: {
  imports = [./niri];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 48;

        modules-left = ["niri/workspaces"];
        modules-center = ["clock#time" "clock#date"];
        modules-right = ["battery" "tray"];

        "niri/workspaces" = {
          format = "{icon}";
        };

        "clock#time" = {
          format = "{:%H:%M}";
        };

        "clock#date" = {
          format = "{:%d.%m}";
        };

        "tray" = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };

    style = builtins.readFile ./waybar.css;
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
    style = ''
      window {
        background-color: rgba(12, 12, 12, 0.8);
      }

      button {
        color: var(--view-fg-color);
        background-color: var(--view-bg-color);
        border: none;
        padding: 10px;
      }

      /** The button's label */
      button label.action-name {
        font-size: 24px;
      }

      /** The keyboard shortcut label for each of the labels */
      button label.keybind {
        font-size: 20px;
        font-family: monospace;
      }

      button:hover label.keybind,
      button:focus label.keybind {
        opacity: 1;
      }

      button:hover,
      button:focus {
        color: var(--accent-color);
        background-color: var(--window-bg-color);
      }

      button:active {
        color: var(--accent-fg-color);
        background-color: var(--accent-bg-color);
      }
    '';
  };

  services.swayosd.enable = true;
  services.swaync.enable = true;
}
