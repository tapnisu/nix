{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tapciify.url = "github:tapnisu/tapciify";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-wsl, tapciify, ... }: {
    nixosConfigurations = {
      tapnisu-laptop = nixpkgs.lib.nixosSystem {
        stdenv.hostPlatform.system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit tapciify; };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-desktop = nixpkgs.lib.nixosSystem {
        stdenv.hostPlatform.system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit tapciify; };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-laptop-wsl = nixpkgs.lib.nixosSystem {
        stdenv.hostPlatform.system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/laptop-wsl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit tapciify; isWSL = true; };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };

      tapnisu-desktop-wsl = nixpkgs.lib.nixosSystem {
        stdenv.hostPlatform.system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/desktop-wsl/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit tapciify; isWSL = true; };
            home-manager.users.tapnisu = import ./home.nix;
          }
        ];
      };
    };
  };
}
