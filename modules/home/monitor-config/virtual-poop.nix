{...}: {
  programs.niri.settings.outputs."Virtual-1" = {
    mode = {
      width = 1280;
      height = 720;
      refresh = 60.0;
    };
    scale = 1.0;
  };
}
