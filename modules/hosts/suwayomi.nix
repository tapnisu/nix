{...}: {
  services.suwayomi-server = {
    enable = true;
    settings = {
      server = {
        socksProxyEnabled = true;
        socksProxyHost = "127.0.0.1";
        socksProxyPort = "10808";

        extensionRepos = [
          "https://github.com/keiyoushi/extensions/raw/repo/index.pb"
          "https://github.com/yuzono/manga-repo/raw/repo/index.pb"
          "https://github.com/yuzono/cursed-manga-repo/raw/repo/index.pb"
        ];
      };
    };
  };
}
