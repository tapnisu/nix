{pkgs, ...}: {
  programs.rofi = {
    enable = true;

    modes = ["combi"];
    terminal = "${pkgs.alacritty}/bin/alacritty";
    font = "Sans Adwaita 12";

    theme = ./theme.rasi;
  };
}
