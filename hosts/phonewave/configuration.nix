{
  config,
  pkgs,
  ...
}: {
  imports = [../common.nix];
  networking.hostName = "tapnisu-phonewave";
}
