{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/hosts/common
    ../../modules/hosts/common/real-hardware.nix
    ../../modules/hosts/common/desktop.nix

    ../../modules/hosts/gaming.nix
    ../../modules/hosts/obs.nix
    ../../modules/hosts/bluetooth.nix
    ../../modules/hosts/openssh.nix
    ../../modules/hosts/syncthing
  ];

  networking.hostName = "tapnisu-desktop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  system.stateVersion = "25.11";
}
