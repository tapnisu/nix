{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        normal = {
          family = "Iosevka Term Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Iosevka Term Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Iosevka Term Nerd Font";
          style = "Italic";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  home.sessionVariables.TERMINAL = "alacritty";
}
