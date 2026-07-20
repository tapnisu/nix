{
  description = "NixOS configuration";

  nixConfig.substituters = ["https://nixos-cache-proxy.cofob.dev"];

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
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixos-wsl,
    nix-on-droid,
    tapciify,
    ...
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = {
      tapnisu-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit tapciify;
              isWSL = false;
            };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit tapciify;
              isWSL = false;
            };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-laptop-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/laptop-wsl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit tapciify;
              isWSL = true;
            };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-desktop-wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/desktop-wsl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit tapciify;
              isWSL = true;
            };
            home-manager.users.tapnisu = import ./home.nix;
          }
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
            home-manager.config = ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit tapciify;
              isWSL = false;
            };
          }
        ];
      };
    };
  };
}
