{...}: {
  imports = [
    ../../modules/hosts/common
    ../../modules/hosts/common/wsl.nix

    ../../modules/hosts/openssh.nix
    ../../modules/hosts/nvidia/wsl.nix
  ];
  networking.hostName = "tapnisu-desktop-wsl";
}
