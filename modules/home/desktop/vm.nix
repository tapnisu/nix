{pkgs, ...}: {
  xdg.configFile."niri/config.kdl".source = ./niri/niri.kdl;

  programs.waybar = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        layer = "overlay";
      };
    };
  };
}
