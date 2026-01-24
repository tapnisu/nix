{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  wsl.enable = true;
  wsl.defaultUser = "tapnisu";

  networking.hostName = "tapnisu-desktop-wsl";

  virtualisation.docker.enable = true;

  vscode-remote-workaround.enable = true;
  vscode-remote-workaround.package = pkgs.nodejs_22;
}
