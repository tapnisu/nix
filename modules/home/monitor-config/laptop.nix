{...}: {
  programs.niri.settings.outputs."eDP-1" = {
    mode = {
      width = 2560;
      height = 1600;
      refresh = 120.0;
    };
    scale = 1.5;
  };
}
