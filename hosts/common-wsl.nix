{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  wsl.enable = true;
  wsl.defaultUser = "tapnisu";

  wsl.docker-desktop.enable = true;

  programs.nix-ld.enable = true;
}
