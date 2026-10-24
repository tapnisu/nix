{...}: {
  imports = [
    ../../modules/hosts/common
    ../../modules/hosts/common/wsl.nix

    ../../modules/hosts/openssh.nix
  ];

  networking.hostName = "tapnisu-laptop-wsl";

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  system.stateVersion = "25.11";
}
