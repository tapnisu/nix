{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/prerelease-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    tapciify.url = "github:tapnisu/tapciify";
    niri.url = "github:sodiboo/niri-flake";
    fastpotify.url = "github:crmne/fastpotify";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixos-wsl,
    nix-on-droid,
    ...
  }: let
    mkSystem = {
      hostname,
      system ? "x86_64-linux",
      extraModules ? [],
      homeModules ? [./modules/home/common/default.nix],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules =
          [
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.users.tapnisu = {
                imports = homeModules;
              };
            }
          ]
          ++ extraModules;
      };
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = {
      tapnisu-laptop = mkSystem {
        hostname = "laptop";
        homeModules = [
          ./modules/home/common/default.nix
          ./modules/home/desktop/default.nix
          ./modules/home/monitor-config/laptop.nix
        ];
      };

      tapnisu-desktop = mkSystem {
        hostname = "desktop";
        homeModules = [
          ./modules/home/common/default.nix
          ./modules/home/desktop/default.nix
          ./modules/home/monitor-config/desktop.nix
        ];
      };

      virtual-poop = mkSystem {
        hostname = "virtual-poop";
        homeModules = [
          ./modules/home/common/default.nix
          ./modules/home/desktop/default.nix
          ./modules/home/monitor-config/virtual-poop.nix
        ];
      };

      tapnisu-laptop-wsl = mkSystem {
        hostname = "laptop-wsl";
        extraModules = [nixos-wsl.nixosModules.default];
        homeModules = [
          ./modules/home/common/default.nix
          ./modules/home/wsl/default.nix
        ];
      };

      tapnisu-desktop-wsl = mkSystem {
        hostname = "desktop-wsl";
        extraModules = [nixos-wsl.nixosModules.default];
        homeModules = [
          ./modules/home/common/default.nix
          ./modules/home/wsl/default.nix
        ];
      };
    };

    nixOnDroidConfigurations = {
      tapnisu-phonewave = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/phonewave/configuration.nix
          {
            home-manager.config = {
              imports = [
                ./modules/home/common/default.nix
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };
    };
  };
}
