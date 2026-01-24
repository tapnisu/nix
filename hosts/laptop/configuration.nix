{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../common.nix
    ];

  networking.hostName = "tapnisu-laptop";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  services.tlp.enable = true;
  services.thermald.enable = true;
  services.fprintd.enable = true;

  programs.niri.enable = true;
  services.xserver.xkb.layout = "us,ru";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
