{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  wsl.enable = true;
  wsl.defaultUser = "tapnisu";

  networking.hostName = "tapnisu-desktop-wsl";

  virtualisation.docker.enable = true;
}
