{lib, ...}: {
  imports = [
    ./cli.nix
    ./git.nix
    ./gui.nix
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
      setSessionVariables = true;
    };
  };

  home.stateVersion = "25.11";
}
