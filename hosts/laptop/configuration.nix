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
    ../../modules/hosts/suwayomi.nix

    ../../modules/hosts/syncthing
    ../../modules/hosts/syncthing/laptop.nix
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

  console.font = "ter-v28n";

  services.fprintd.enable = true;
  services.fprintd.tod.enable = false;
  security.pam.services.gtklock.fprintAuth = true;

  nixpkgs.overlays = [
    (final: prev: {
      libfprint = prev.libfprint.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "Sbenazar";
          repo = "goodix-5f10-libfprint";
          rev = "625c733837f05a24bcf81999b654b26ce5530313";
          hash = "sha256-u/S4FH6XQQ+lTkbpApfGmdiOHGGtTBxh6/NWmbkf16o=";
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

  boot.loader.grub.minegrub-world-sel.background = "assets/background-scaled/background-2560x1440.png";
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  system.stateVersion = "25.11";
}
