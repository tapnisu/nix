{
  config,
  pkgs,
  ...
}: {
  imports = [./common.nix];

  wsl = {
    enable = true;
    defaultUser = "tapnisu";
    interop.register = true;
    useWindowsDriver = true;
  };

  # wsl.docker-desktop.enable = true;
  virtualisation.docker.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
