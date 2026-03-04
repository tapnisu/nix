{
  config,
  pkgs,
  ...
}: {
  imports = [../common-droid.nix];
  networking.hostName = "tapnisu-phonewave";
}
