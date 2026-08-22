{
  niri,
  pkgs,
  ...
}: {
  imports = [
    niri.homeModules.niri
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

      outputs."Virtual-1" = {
        mode = {
          width = 1280;
          height = 720;
          refresh = 60.0;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };

      layout = {
        gaps = 16;
        center-focused-column = "never";

        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];

        focus-ring = {
          enable = true;
          width = 4;
          active.color = "#7fc8ff";
          inactive.color = "#505050";
        };

        border = {
          enable = false;
          width = 4;
          active.color = "#ffc87f";
          inactive.color = "#505050";
          urgent.color = "#9b0000";
        };

        shadow = {
          enable = true;
          softness = 30.0;
          spread = 5.0;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };
      };

      spawn-at-startup = [
        {command = ["waybar"];}
        {command = ["sh" "-c" "swaybg -i ~/Pictures/Wallpapers/__tohno_akiha_kohaku_hisui_and_yumizuka_satsuki_tsukihime_drawn_by_yakksan__34bf94fed8b9c11c0006850ce3bf214a.jpg -m fill"];}
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
