{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common-real-hardware.nix
    ../../modules/hosts/gaming.nix
    ../../modules/hosts/obs.nix
    ../../modules/hosts/bluetooth.nix
    ../../modules/syncthing/laptop.nix
  ];

  networking.hostName = "tapnisu-laptop";

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GiB
    }
  ];

  boot.kernelParams = [
    "iommu=pt" # prevents sleep mode from taking ages
    "resume_offset=36470784" # https://nixos.wiki/wiki/Hibernation
  ];
  boot.resumeDevice = "/dev/disk/by-uuid/efc7234a-e121-4130-9f31-6127a9c84415";

  console.font = lib.mkDefault "ter-v32n";

  services.fprintd.enable = true;
  services.fprintd.tod.enable = false;
  security.pam.services.gtklock.fprintAuth = true;

  nixpkgs.overlays = [
    (final: prev: {
      libfprint = prev.libfprint.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "Sbenazar";
          repo = "goodix-5f10-libfprint";
          rev = "65ae70f2e1e3c41ec8a8911bc6282f54ffabdc2d";
          hash = "sha256-NQkTnb7N9EHYU1LkLIleq0JsklFExWf9WMlAm1hf9DI=";
        };
        patches = [];
        mesonFlags = (old.mesonFlags or []) ++ ["-Ddrivers=goodixtls5f10"];
      });
    })
  ];

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
