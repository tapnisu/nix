{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "kohaku" = {
        hostname = "kohaku.tapni.su";
        user = "tapnisu";
      };
      "hisui" = {
        hostname = "hisui.tapni.su";
        user = "tapnisu";
      };
      "akiha" = {
        hostname = "akiha.tapni.su";
        user = "tapnisu";
      };
      "desktop" = {
        hostname = "desktop.tapni.su";
        user = "tapnisu";
      };
      "laptop" = {
        hostname = "laptop.tapni.su";
        user = "tapnisu";
      };
      "phonewave" = {
        hostname = "phonewave.tapni.su";
        user = "u0_a338";
      };
      "rybin-pc" = {
        hostname = "rybin-pc";
        user = "zlobi";
      };
    };
  };
}
