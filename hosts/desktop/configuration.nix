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
  ];

  networking.hostName = "tapnisu-desktop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];
}
