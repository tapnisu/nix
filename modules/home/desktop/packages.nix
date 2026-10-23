{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.spotifast.packages.${pkgs.stdenv.hostPlatform.system}.default

    brightnessctl
    playerctl

    libreoffice-qt
    hunspell
    hunspellDicts.en-us-large
    hunspellDicts.ru-ru

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
