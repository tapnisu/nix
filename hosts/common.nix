{
  config,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      flake-registry = "";
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      substituters = lib.mkForce [
        "https://nixos-cache-proxy.cofob.dev"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  boot.binfmt.emulatedSystems = ["aarch64-linux"];
  time.timeZone = "Asia/Krasnoyarsk";

  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    supportedLocales = ["all"];

    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  environment = {
    variables = {
      LANG = "ru_RU.UTF-8";
      EDITOR = "nvim";
    };

    systemPackages = with pkgs; [
      neovim
      wget
      git
      fastfetch
    ];
  };

  users.users.tapnisu = {
    isNormalUser = true;
    description = "Aleksei Rybin";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMW/+EvS0eyqdQNWlzO4TxWTy0sVQ2n6pS5YGhB9Vyyt tapnisu@tapnisu-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsEj2s/rcKJPg0HwTW75/MdyomK6q1K625/4BeXVB/n u0_a338@localhost"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILn4cwutqgmbLpkMOIujqKuyUxvdX995J5/191UKP6ns tapnisu@tapnisu-laptop"
    ];
  };

  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.dconf.enable = true;

  system.stateVersion = "25.11";
}
