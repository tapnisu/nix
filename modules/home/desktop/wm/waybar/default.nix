{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";

        margin-bottom = 8;
        margin-left = 8;
        margin-right = 8;

        modules-left = ["niri/workspaces"];
        modules-center = ["clock"];
        modules-right = ["niri/language" "network" "battery" "tray"];

        "niri/workspaces" = {
          format = "{icon}";
        };

        "niri/language" = {
          format = "{short}";
        };

        "clock" = {
          format = "{:%H:%M %d.%m}";
          tooltip = false;
        };

        "network" = {
          format-wifi = "{icon}";
          format-disconnected = "⚠";
          format-icons = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          tooltip-format = "{essid}\n{ipaddr}";
          on-click = "nmgui";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
          tooltip-format = "Time remaining: {time}";
        };

        "tray" = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };

    style = ./style.css;
  };
}
