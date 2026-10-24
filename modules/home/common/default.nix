{
  lib,
  osConfig,
  ...
}: {
  imports = [
    ./cli.nix
    ./face.nix
    ./git.nix
    ./packages.nix
    ./ssh.nix
  ];

  home = {
    username = lib.mkDefault "tapnisu";
    homeDirectory = lib.mkDefault "/home/tapnisu";
    sessionVariables.EDITOR = "nvim";
  };

  xdg = {
    mimeApps.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
    };
  };

  home.stateVersion = lib.mkDefault osConfig.system.stateVersion;
}
