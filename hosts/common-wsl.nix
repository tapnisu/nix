{
  config,
  pkgs,
  ...
}: {
  imports = [./common.nix];

  wsl.enable = true;
  wsl.defaultUser = "tapnisu";

  # wsl.docker-desktop.enable = true;
  virtualisation.docker.enable = true;
}
