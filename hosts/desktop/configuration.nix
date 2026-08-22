{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common-real-hardware.nix
  ];

  networking.hostName = "tapnisu-desktop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];
}
