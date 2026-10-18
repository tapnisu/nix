{...}: {
  imports = [./niri ./waybar ./fuzzel ./swayidle.nix ./wleave];

  services.swayosd.enable = true;
  services.swaync.enable = true;
}
