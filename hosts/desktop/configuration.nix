{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common-real-hardware.nix
    ../../modules/hosts/gaming.nix
    ../../modules/hosts/obs.nix
    ../../modules/hosts/nvidia
    ../../modules/hosts/bluetooth.nix
  ];

  networking.hostName = "tapnisu-desktop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];
}
