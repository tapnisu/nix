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

        ShowTrayIcon = true; # it won't minimize without this
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        MinimizeOnClose = true;
      };
      FdoSecrets.Enabled = true;
    };
  };

  xdg.autostart.enable = true;
}
