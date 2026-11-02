{...}: {
  imports = [./niri ./waybar ./rofi ./swayidle.nix ./wleave];

  services.swayosd.enable = true;
  services.swaync.enable = true;
}
