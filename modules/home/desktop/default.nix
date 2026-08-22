{...}: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./mpv.nix
    ./packages.nix
    ./thunderbird.nix
    ./vm.nix
    ./zed.nix
    ./spicetify.nix
  ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = ["nautilus.desktop"];
  };
}
