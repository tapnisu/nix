{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.spotifast.packages.${pkgs.stdenv.hostPlatform.system}.default

    brightnessctl
    playerctl

    nautilus
    loupe
    imv
    swaybg
    telegram-desktop
    vencord
    moonlight-qt
    obsidian
    readest
    prismlauncher
    qbittorrent
    gnome-calculator
    gnome-calendar
  ];
}
