{...}: {
  imports = [
    ../../modules/hosts/common
    ../../modules/hosts/common/wsl.nix

    ../../modules/hosts/openssh.nix
  ];

  networking.hostName = "tapnisu-laptop-wsl";

  system.stateVersion = "25.11";
}
