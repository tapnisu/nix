{...}: {
  networking.networkmanager.enable = true;

  services.udisks2.enable = true;
  services.thermald.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
