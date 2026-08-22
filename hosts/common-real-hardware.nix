{
  config,
  pkgs,
  ...
}: {
  imports = [./common.nix];

  networking.networkmanager.enable = true;
  time.hardwareClockInLocalTime = true; # hi windows

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

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

  programs.niri.enable = true;
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
    gamescope-wsi
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  programs.gamemode.enable = true;

  services.flatpak.enable = true;

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

    configDir = "/home/tapnisu/.config/syncthing";
    settings = {
      options = {
        urAccepted = -1;
      };
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

  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
}
