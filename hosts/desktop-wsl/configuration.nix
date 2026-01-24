{
  config,
  pkgs,
  ...
}: {
  imports = [../common-wsl.nix];
  networking.hostName = "tapnisu-desktop-wsl";
}
