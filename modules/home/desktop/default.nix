{...}: {
  imports = [
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./mpv.nix
    ./packages.nix
    ./polkit.nix
    ./thunderbird.nix
    ./vm.nix
    ./zed.nix
  ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = ["nautilus.desktop"];
  };
}
