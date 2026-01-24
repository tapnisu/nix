{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common-real-hardware.nix
  ];

  networking.hostName = "tapnisu-laptop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];

  console.font = "ter-v32n";

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; # doesn't work tho :p

  # 150% scaling related fixes
  environment.sessionVariables = {
    # This fixes blurriness in Electron/Chromium apps
    NIXOS_OZONE_WL = "1";

    # Optional: Fixes blurriness in Firefox (though usually default now)
    MOZ_ENABLE_WAYLAND = "1";

    # Optional: Fixes blurriness in Qt apps (like VLC or OBS)
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}
