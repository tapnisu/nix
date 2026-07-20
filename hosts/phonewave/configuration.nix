{
  config,
  pkgs,
  lib,
  ...
}: {
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    substituters = https://nixos-cache-proxy.cofob.dev
  '';

  environment.packages = with pkgs; [
    neovim
    wget
    git
    fastfetch
    zsh
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    LANG = "ru_RU.UTF-8";
  };

  user.shell = pkgs.zsh;

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "25.11";
}
