{pkgs, ...}: {
  home.packages = with pkgs; [
    keepassxc
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
  ];
}
