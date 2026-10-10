{...}: {
  programs.keepassxc = {
    autostart = true;
    enable = true;
    settings = {
      Browser = {
        Enabled = true;
      };
      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        CompactMode = true;
        HidePasswords = true;
      };
      FdoSecrets.Enabled = true;
    };
  };

  xdg.autostart.enable = true;
}
