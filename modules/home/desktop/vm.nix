{pkgs, ...}: {
  imports = [./niri];

  programs.waybar = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty -e";
        layer = "overlay";
      };
    };
  };

  programs.swaylock.enable = true;

  services.swayosd = {
    enable = true;
  };

  services.swaync.enable = true;
}
