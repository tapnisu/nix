{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 8;
          y = 8;
        };
        dynamic_padding = true;
      };
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

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "alacritty.desktop"
      ];
    };
  };

  home.sessionVariables.TERMINAL = "alacritty";
}
