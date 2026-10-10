{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.spotifast.packages.${pkgs.stdenv.hostPlatform.system}.default

    brightnessctl

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
    throne
    vesktop
    qbittorrent
    trackma-qt
  ];
}
