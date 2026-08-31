{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.fastpotify.packages.${pkgs.stdenv.hostPlatform.system}.default

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
