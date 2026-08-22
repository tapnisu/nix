{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common-real-hardware.nix
  ];

  networking.hostName = "virtual-poop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 4 * 1024; # 4GiB
    }
  ];

  console.font = "ter-v16n";
}
