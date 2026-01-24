{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  wsl.enable = true;
  wsl.defaultUser = "tapnisu";

  networking.hostName = "tapnisu-laptop-wsl";

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;
}
