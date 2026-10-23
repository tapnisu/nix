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
        modules-right = ["niri/language" "battery" "tray"];

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

        "tray" = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };

    style = ./style.css;
  };
}
