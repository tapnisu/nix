{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.minegrub-world-sel-theme.nixosModules.default
    "${inputs.nix-flatpak}/modules/nixos.nix"
  ];

  boot = {
    supportedFilesystems = ["ntfs"];
    loader = {
      grub = {
        enable = true;
        splashImage = null;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;

        minegrub-world-sel = {
          enable = true;
          background = lib.mkDefault "assets/background-scaled/background-1920x1080.png";

          customIcons = with config.system.nixos; [
            {
              name = distroId;
              lineTop = distroName + " " + codeName + " (" + version + ")";
              lineBottom = "Survival Mode, No Cheats, Version: " + release;
              imgName = "nixos";
            }
          ];
        };
      };
      efi.canTouchEfiVariables = true;
    };
  };

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  console = {
    packages = with pkgs; [terminus_font];
    font = lib.mkDefault "ter-v16n";
    useXkbConfig = true;
  };

  virtualisation.docker.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true;

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
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config.common.default = "gtk";
  };

  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  # https://nixos.wiki/wiki/Hibernation
  services.power-profiles-daemon.enable = true;
  # Suspend first then hibernate when closing the lid
  services.logind.settings.Login.LidSwitch = "suspend-then-hibernate";

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };

  # Define time delay for hibernation
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "30m";
    SuspendState = "mem";
  };

  programs.gtklock = {
    enable = true;

    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    ntfs3g
  ];

  programs.dconf.enable = true;
}
