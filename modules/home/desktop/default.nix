{...}: {
  imports = [
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./gaming.nix
    ./keepassxc.nix
    ./mpv.nix
    ./packages.nix
    ./polkit.nix
    ./throne.nix
    ./thunderbird.nix
    ./trackma
    ./vm.nix
    ./zed.nix
  ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = ["org.gnome.Nautilus.desktop"];
  };
}
