{
  config,
  pkgs,
  ...
}: {
  imports = [../common-wsl.nix ../../modules/hosts/nvidia/wsl.nix];
  networking.hostName = "tapnisu-desktop-wsl";
}
