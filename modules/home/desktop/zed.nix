{lib, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "toml" "rust"];
    userSettings = {
      autosave = "on_focus_change";
      auto_update = false;
      disable_ai = true;
      terminal = {
        font_family = "IosevkaTerm Nerd Font";
      };
      ui_font_family = ".ZedSans";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "dark";
        light = "Gruvbox Light Soft";
        dark = "Gruvbox Dark Hard";
      };
      buffer_font_family = "Iosevka Nerd Font";
    };
  };

  home.sessionVariables.EDITOR = lib.mkDefault "zed";
}
