{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    "${inputs.nix-flatpak}/modules/nixos.nix"
    ./common.nix
  ];

  networking.networkmanager.enable = true;
  time.hardwareClockInLocalTime = true; # hi windows

  boot = {
    supportedFilesystems = ["ntfs"];
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };

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

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  console = {
    packages = with pkgs; [terminus_font];
    font = "ter-v16n";
    useXkbConfig = true;
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    ntfs3g
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [22222];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;

    user = "tapnisu";
    group = "users";

    settings = {
      devices = {
        "Tapnisu Desktop" = {id = "F6FWJLA-TZXKDLD-BKEYDQM-7C3B2OK-TXWKBB4-Z27CSBB-J527OKV-W6EWRQQ";};
        "Tapnisu Laptop" = {id = "XE5RPQS-KUNJALJ-XJUXGYI-WZDPWEJ-XH4QKVJ-EQH6KRX-VPLIBBV-5P2OWQQ";};
        "Tapnisu Laptop NixOS" = {id = "U6NKQLP-RH3BKAD-2TZIUXC-3HNMK45-RSYQRYL-2AILKYI-W5NBYFC-5BINTA4";};
        "Tapnisu PhoneWave" = {id = "6NM7XYU-UHWI23M-Y5CAGDE-WMXLF2E-ZMN5RCW-ECQ2DT6-UD4G4TF-LTQAKQI";};
        "Kohaku" = {id = "N6D4XN5-4SFUGUD-CSOVG67-QJNIDTZ-PIUZIWV-JNHTJE2-AOSNFOG-6NBTEAK";};
      };
      gui.user = "tapnisu";
      options.urAccepted = -1; # dumb pop up
    };
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      gnome = super.gnome.overrideScope (gself: gsuper: {
        nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
          buildInputs =
            nsuper.buildInputs
            ++ (with super.gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      });
    })
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = "gtk";
  };

  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
}
