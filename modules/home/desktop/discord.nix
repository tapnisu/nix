# Actually it is vesktop
{pkgs, ...}: {
  programs.vesktop = {
    enable = true;
    package = let
      mkWrapped = pkg:
        pkgs.symlinkJoin {
          name = "vesktop-proxy";
          paths = [pkg];
          buildInputs = [pkgs.makeWrapper];
          postBuild = ''wrapProgram $out/bin/vesktop --add-flags "--proxy-server=socks5://127.0.0.1:10808"'';
        };
    in
      (mkWrapped pkgs.vesktop)
      // {
        override = args: mkWrapped (pkgs.vesktop.override args);
      };
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
