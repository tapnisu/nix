{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "kohaku" = {
        hostname = "kohaku.tapni.su";
        user = "tapnisu";
        port = 22222;
      };
      "hisui" = {
        hostname = "hisui.tapni.su";
        user = "tapnisu";
        port = 22222;
      };
      "akiha" = {
        hostname = "akiha.tapni.su";
        user = "tapnisu";
        port = 22222;
      };
      "desktop" = {
        hostname = "desktop.tapni.su";
        user = "tapnisu";
        port = 22222;
      };
      "laptop" = {
        hostname = "laptop.tapni.su";
        user = "tapnisu";
        port = 22222;
      };
      "phonewave" = {
        hostname = "phonewave.tapni.su";
        user = "u0_a338";
        port = 22222;
      };
      "rybin-pc" = {
        hostname = "rybin-pc";
        user = "zlobi";
        port = 22222;
      };
    };
  };
}
