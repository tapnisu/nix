# Actually it is vesktop
{...}: {
  programs.vesktop = {
    enable = true;
    settings = {
      minimizeToTray = true;
      tray = true;
    };
    vencord.settings = {
      themeLinks = [
        "https://raw.githubusercontent.com/DiscordStyles/HorizontalServerList/deploy/HorizontalServerList.theme.css"
      ];
      plugins = {
        ClearURLs.enabled = true;
        CrashHandler.enabled = true;
        Experiments.enabled = true;
        FakeNitro.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        GameActivityToggle.enabled = true;
        VolumeBooster.enabled = true;
        YoutubeAdblock.enabled = true;
      };
    };
  };
}
