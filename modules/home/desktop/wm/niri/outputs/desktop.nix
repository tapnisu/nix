{...}: {
  programs.niri.settings.outputs = {
    "DP-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 239.960;
      };
      scale = 1.0;
      position = {
        x = 0;
        y = 0;
      };
    };

    "DP-2" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 74.970;
      };
      scale = 1.0;
      position = {
        x = -1920;
        y = 0;
      };
    };

    "HDMI-A-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 74.970;
      };
      scale = 1.0;
      transform.rotation = 270;
      position = {
        x = 1920;
        y = -300;
      };
    };
  };
}
