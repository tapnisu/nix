{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/hosts/common
    ../../modules/hosts/common/real-hardware.nix
    ../../modules/hosts/common/desktop.nix

    ../../modules/hosts/openssh.nix
  ];

  networking.hostName = "virtual-poop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 4 * 1024; # 4GiB
    }
  ];

  virtualisation.virtualbox.guest.enable = lib.mkForce false; # warning: implicit declaration of function 'drm_fb_helper_alloc_info'; did you mean 'drm_fb_helper_fill_info'? [-Wimplicit-function-declaration]
}
