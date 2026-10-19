{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
      };

      layout = {
        gaps = 12;
        center-focused-column = "never";

        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];

        focus-ring = {
          enable = true;
          width = 4;
          active.color = "#3584e4aa";
          inactive.color = "#303030";
        };

        border = {
          enable = false;
          width = 4;
          active.color = "#78aeed";
          inactive.color = "#242424";
          urgent.color = "#c01c28";
        };

        shadow = {
          enable = true;
          softness = 30.0;
          spread = 5.0;
          offset = {
            x = 0;
            y = 5;
          };
          color = "rgba(0, 0, 0, 0.4)";
        };
      };

      gestures = {
        hot-corners.enable = false;
      };

      spawn-at-startup = [
        {command = ["waybar"];}
        {command = ["wleave" "--service"];}
        {command = ["sh" "-c" "swaybg -i ~/Pictures/Wallpapers/__hakurei_reimu_touhou_and_1_more_drawn_by_shishui_guima__9ad837aabef5876d8bd24b948bddda15.png -m fill"];}
      ];

      cursor = {
        theme = "Breeze_Light";
        size = 24;
      };

      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      window-rules = [
        {
          matches = [{app-id = "^org\\.wezfurlong\\.wezterm$";}];
          default-column-width = {};
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {app-id = "^org\\.keepassxc\\.KeePassXC$";}
            {app-id = "^org\\.gnome\\.World\\.Secrets$";}
          ];
          block-out-from = "screen-capture";
        }
        {
          matches = [
            {app-id = "steam";}
            {title = "^notificationtoasts_\d+_desktop$";}
          ];
          default-floating-position = {
            x = 0;
            y = 0;
            relative-to = "bottom-right";
          };
        }
        {
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };
}
