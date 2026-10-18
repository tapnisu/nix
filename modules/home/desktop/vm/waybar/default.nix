{...}: {
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

    style = ./style.css;
  };
}
