{...}: {
  imports = [
    # works without Unfree = true?
    # ./ffmpeg.nix
    ./obs.nix
  ];

  nixpkgs.config.cudaSupport = true;
}
